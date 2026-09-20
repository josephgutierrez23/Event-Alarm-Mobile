"""Dev-only Figma vs Flutter golden overlay/diff. Not shipped in the app."""

from __future__ import annotations

import os
from pathlib import Path

from PIL import Image, ImageChops, ImageEnhance, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parents[2]
ASSETS = Path(
    r"C:\Users\Joseph\.cursor\projects\d-MISO-Event-Alarm-Mobile\assets"
)
OUT = Path(__file__).resolve().parent

FIGMA = {
    "splash": ASSETS
    / "c__Users_Joseph_AppData_Roaming_Cursor_User_workspaceStorage_0982e24f9e0c95450fe5860142fa3e3f_images_image-2acfdcc2-c33d-4a83-b9db-f3db06a0f934.png",
    "login": ASSETS
    / "c__Users_Joseph_AppData_Roaming_Cursor_User_workspaceStorage_0982e24f9e0c95450fe5860142fa3e3f_images_image-348c4513-a922-40b6-afd8-4a6433c10cc8.png",
    "home": ASSETS
    / "c__Users_Joseph_AppData_Roaming_Cursor_User_workspaceStorage_0982e24f9e0c95450fe5860142fa3e3f_images_image-9429ef06-f2c2-4b76-b293-14e641babb67.png",
    "editor": ASSETS
    / "c__Users_Joseph_AppData_Roaming_Cursor_User_workspaceStorage_0982e24f9e0c95450fe5860142fa3e3f_images_image-e3a6e3df-addd-4117-b3f8-69fb648cb4d9.png",
    "event": ASSETS
    / "c__Users_Joseph_AppData_Roaming_Cursor_User_workspaceStorage_0982e24f9e0c95450fe5860142fa3e3f_images_image-eb16facf-87b7-4726-92c6-f3214b50550e.png",
    "ringing": ASSETS
    / "c__Users_Joseph_AppData_Roaming_Cursor_User_workspaceStorage_0982e24f9e0c95450fe5860142fa3e3f_images_image-31e4d2ea-9e2d-4f2b-877a-2a4a742544b3.png",
    "challenge": ASSETS
    / "c__Users_Joseph_AppData_Roaming_Cursor_User_workspaceStorage_0982e24f9e0c95450fe5860142fa3e3f_images_image-9a77bfdb-91bf-482a-8c51-ffcbec0172f9.png",
}

GOLDENS = ROOT / "test" / "goldens"


def is_screen(rgb: tuple[int, int, int]) -> bool:
    r, g, b = rgb[:3]
    # App noche surfaces are blue-black, not Figma's neutral canvas gray.
    return b >= r + 5 and g >= r and r < 40 and b < 70 and (r + g + b) < 140


def crop_phone(im: Image.Image) -> Image.Image:
    rgb = im.convert("RGB")
    px = rgb.load()
    w, h = rgb.size
    col_hits = [sum(1 for y in range(h) if is_screen(px[x, y])) for x in range(w)]
    row_hits = [sum(1 for x in range(w) if is_screen(px[x, y])) for y in range(h)]
    left = next(i for i, n in enumerate(col_hits) if n > h * 0.35)
    right = next(i for i in range(w - 1, -1, -1) if col_hits[i] > h * 0.35)
    top = next(i for i, n in enumerate(row_hits) if n > w * 0.45)
    bot = next(i for i in range(h - 1, -1, -1) if row_hits[i] > w * 0.45)
    # Inset 1px Figma device stroke / selection ring.
    left = min(w - 2, left + 1)
    top = min(h - 2, top + 1)
    right = max(left + 2, right - 1)
    bot = max(top + 2, bot - 1)
    return rgb.crop((left, top, right + 1, bot + 1))


def crop_nth_phone(im: Image.Image, index: int = 0) -> Image.Image:
    rgb = im.convert("RGB")
    px = rgb.load()
    w, h = rgb.size
    col_hits = [sum(1 for y in range(h) if is_screen(px[x, y])) for x in range(w)]
    bands: list[tuple[int, int]] = []
    x = 0
    while x < w:
        while x < w and col_hits[x] <= h * 0.25:
            x += 1
        if x >= w:
            break
        left = x
        while x < w and col_hits[x] > h * 0.25:
            x += 1
        bands.append((left, x - 1))
    left, right = bands[index]
    row_hits = [
        sum(1 for cx in range(left, right + 1) if is_screen(px[cx, y]))
        for y in range(h)
    ]
    span = right - left + 1
    top = next(i for i, n in enumerate(row_hits) if n > span * 0.45)
    bot = next(i for i in range(h - 1, -1, -1) if row_hits[i] > span * 0.45)
    left = min(w - 2, left + 1)
    top = min(h - 2, top + 1)
    right = max(left + 2, right - 1)
    bot = max(top + 2, bot - 1)
    return rgb.crop((left, top, right + 1, bot + 1))


def fit_canvas(phone: Image.Image, size: tuple[int, int]) -> Image.Image:
    tw, th = size
    scale = tw / phone.width
    nh = max(1, int(round(phone.height * scale)))
    resized = phone.resize((tw, nh), Image.Resampling.LANCZOS)
    canvas = Image.new("RGB", size, (14, 24, 34))
    if nh >= th:
        canvas.paste(resized.crop((0, 0, tw, th)), (0, 0))
    else:
        canvas.paste(resized, (0, 0))
    return canvas


def mean_abs(a: Image.Image, b: Image.Image) -> float:
    d = ImageChops.difference(a, b)
    hist = d.convert("L").histogram()
    total = sum(i * n for i, n in enumerate(hist))
    count = sum(hist) or 1
    return total / count


def overlay(figma: Image.Image, flutter: Image.Image) -> Image.Image:
    f = figma.convert("RGBA")
    t = flutter.convert("RGBA")
    t.putalpha(128)
    return Image.alpha_composite(f, t).convert("RGB")


def heatmap(figma: Image.Image, flutter: Image.Image) -> Image.Image:
    d = ImageChops.difference(figma, flutter)
    return ImageEnhance.Contrast(d.convert("RGB")).enhance(3.0)


def side_by_side(figma: Image.Image, flutter: Image.Image, mix: Image.Image, heat: Image.Image, label: str, mae: float) -> Image.Image:
    gap = 8
    w, h = figma.size
    canvas = Image.new("RGB", (w * 4 + gap * 5, h + 36), (20, 24, 28))
    for i, img in enumerate((figma, flutter, mix, heat)):
        canvas.paste(img, (gap + i * (w + gap), 28))
    draw = ImageDraw.Draw(canvas)
    titles = ("Figma", "Flutter", "50% overlay", f"diff MAE={mae:.1f}")
    for i, t in enumerate(titles):
        draw.text((gap + i * (w + gap), 6), f"{label}  {t}", fill=(230, 235, 240))
    return canvas


def process(name: str, target: tuple[int, int]) -> None:
    src = Image.open(FIGMA[name])
    phone = crop_phone(src)
    phone.save(OUT / f"{name}_figma_raw.png")
    figma = fit_canvas(phone, target)
    figma.save(OUT / f"{name}_figma.png")
    golden_path = GOLDENS / f"{name}.png"
    if not golden_path.exists():
        print(f"{name}: no golden yet, cropped figma {phone.size} -> {target}")
        return
    flutter = Image.open(golden_path).convert("RGB").resize(target, Image.Resampling.LANCZOS)
    mix = overlay(figma, flutter)
    heat = heatmap(figma, flutter)
    mae = mean_abs(figma, flutter)
    mix.save(OUT / f"{name}_overlay.png")
    heat.save(OUT / f"{name}_diff.png")
    side_by_side(figma, flutter, mix, heat, name, mae).save(OUT / f"{name}_compare.png")
    print(f"{name}: figma_raw={phone.size} mae={mae:.2f}")


def main() -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    for name in ("splash", "login", "home", "event", "ringing"):
        process(name, (360, 800))
    # Full editor frame for the 994-tall Figma hug.
    src = Image.open(FIGMA["editor"])
    phone = crop_phone(src)
    scale = 994 / phone.height
    nw = max(1, int(round(phone.width * scale)))
    resized = phone.resize((nw, 994), Image.Resampling.LANCZOS)
    full = Image.new("RGB", (360, 994), (14, 24, 34))
    full.paste(resized, ((360 - nw) // 2, 0))
    full.save(OUT / "editor_figma_994.png")
    viewport = full.crop((0, 0, 360, 800))
    viewport.save(OUT / "editor_figma.png")
    golden_path = GOLDENS / "editor.png"
    if golden_path.exists():
        flutter = Image.open(golden_path).convert("RGB").resize((360, 800), Image.Resampling.LANCZOS)
        mix = overlay(viewport, flutter)
        heat = heatmap(viewport, flutter)
        mae = mean_abs(viewport, flutter)
        mix.save(OUT / "editor_overlay.png")
        heat.save(OUT / "editor_diff.png")
        side_by_side(viewport, flutter, mix, heat, "editor", mae).save(OUT / "editor_compare.png")
        print(f"editor viewport mae={mae:.2f} raw={phone.size}")
    print("editor 994 crop", phone.size)
    src = Image.open(FIGMA["challenge"])
    phone = crop_nth_phone(src, 0)
    phone.save(OUT / "challenge_figma_raw.png")
    figma = fit_canvas(phone, (360, 800))
    figma.save(OUT / "challenge_figma.png")
    golden_path = GOLDENS / "challenge.png"
    if golden_path.exists():
        flutter = Image.open(golden_path).convert("RGB").resize(
            (360, 800), Image.Resampling.LANCZOS
        )
        mix = overlay(figma, flutter)
        heat = heatmap(figma, flutter)
        mae = mean_abs(figma, flutter)
        mix.save(OUT / "challenge_overlay.png")
        heat.save(OUT / "challenge_diff.png")
        side_by_side(figma, flutter, mix, heat, "challenge", mae).save(
            OUT / "challenge_compare.png"
        )
        print(f"challenge: figma_raw={phone.size} mae={mae:.2f}")


if __name__ == "__main__":
    main()
