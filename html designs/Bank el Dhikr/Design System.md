# Bank el Dhikr — Design System

A single green-led palette + a two-font type scale, named for **Flutter** so it maps 1:1 to `ThemeData` / `TextTheme` / `ColorScheme`.

---

## 1. Color palette (one green-led system)

Keep the brand green `#34C759`. Everything else is a cohesive supporting scale — greens for the brand/primary surfaces, **gold** as the single reward accent (goals, streak flame), and **two fixed category hues** used *only* to distinguish Morning vs Evening adhkar. Nothing else introduces new colors.

### Brand / Primary (green)
| Token | Light | Dark | Use |
|---|---|---|---|
| `primary` (brand) | `#34C759` | `#34C759` | Primary actions, active states, progress fill, logo |
| `primaryMid` | `#1E9E55` | `#27A35A` | Icons, secondary text-on-green, mid gradient stop |
| `primaryDeep` | `#0E5C33` | `#0B4A29` | Balance figure, deep gradient stop, on-green headings |
| `primaryContainer` (chip) | `#F2F5F3` | `#1A241E` | Soft green surfaces / tags |

### Accent & categories
| Token | Value | Use |
|---|---|---|
| `secondary` (gold) | `#FFC02E` | Goal ring, streak flame, reward — the ONLY reward accent |
| `morning` | `#FB8C3C` / bg `#FFF0E4` (dark `#2A1D11`) | Morning adhkar identity only |
| `evening` | `#6C63FF` / bg `#ECEAFF` (dark `#1A1730`) | Evening adhkar identity only |

> All other adhkar (Sleep, After-Prayer, Ruqyah) use **brand green** — categories are green by default; orange/purple are the two exceptions.

### Neutrals
| Token | Light | Dark |
|---|---|---|
| `background` | `#E9ECF1` | `#080C0A` |
| `surface` (card) | `#FFFFFF` | `#121A15` |
| `surfaceMuted` (soft) | `#F3F5F8` | `#0E1511` |
| `onSurface` (text) | `#16211B` | `#EAF1EC` |
| `onSurfaceMuted` | `#7C877F` | `#8A968C` |
| `outline` (line) | `#E7EBEE` | `#1E2823` |

---

## 2. Typography

Two distinct families (title ≠ body), plus a Quranic face for the dhikr text.

| Role | Family | Notes |
|---|---|---|
| **Display / Title** | **Tajawal** | Headings, card titles, buttons, hero numerals |
| **Body / Label** | **IBM Plex Sans Arabic** | All running text, subtitles, captions, nav labels |
| **Dhikr / Quran** | **Cairo** (Clear) · **Amiri Quran** (Uthmani) | The dhikr text only; user-switchable in Settings |

### Type scale — text (4-pt grid, clamped 12–24)
Every textual style is a multiple of 4 and never smaller than 12 or larger than 24. Names match Flutter `TextTheme`.

| Flutter token | Font | Size | Weight | Used for |
|---|---|---|---|---|
| `headlineLarge` | Tajawal | 24 | 900 | Screen titles (قائمة الأذكار, رحلتي) |
| `headlineMedium` | Tajawal | 20 | 900 | Sub-screen headers |
| `titleLarge` | Tajawal | 20 | 800 | Card titles, section headers |
| `titleMedium` | Tajawal | 16 | 800 | Strong labels, tab/segment labels |
| `bodyLarge` | IBM Plex Sans Arabic | 16 | 600 | Primary body, reader translation |
| `bodyMedium` | IBM Plex Sans Arabic | 12 | 500 | Subtitles, hints, list meta |
| `labelLarge` | Tajawal | 12 | 800 | Buttons, chips, pills |
| `labelMedium` | IBM Plex Sans Arabic | 12 | 700 | Nav labels, captions, stat labels |

### Display numerals (hero — outside the 12–24 text rule)
Big counting figures are a deliberate **display** tier, not body text. In Flutter treat these as bespoke `TextStyle`s, not `MediaQuery.textScaler`-driven body text.

| Element | Font | Size | Weight |
|---|---|---|---|
| Tasbih counter | Cairo | 86 | 900 |
| Balance (رصيد) | Tajawal | 54 | 900 |
| Streak / chart value | Tajawal | 34–40 | 900 |
| Reader rep count | Cairo | 44 | 900 |

### Dhikr text
| Context | Font | Size | Notes |
|---|---|---|---|
| Reader dhikr | Cairo / Amiri Quran | 24 | RTL, `height: 2.5` |
| Masbaha phrase | Cairo / Amiri Quran | auto 18–24 | Fits to room, **max 3 lines** |

---

## 3. Spacing & radius
- **4-pt grid** for spacing; card gaps 14–20, screen padding 20, safe-area top ≥ 74.
- Radius: cards 22–24, pills/chips 999, icon tiles 14–15, sheets 30 (top corners).

---

## 4. Direction (RTL / LTR)
The whole chrome mirrors with `Directionality`. In lists & settings rows the **control/icon sits at the end** (left in RTL, right in LTR) and **text at the start** — achieved with logical order, not hard-coded sides. Chevrons flip horizontally by language. Arabic dhikr text stays RTL regardless of UI language.
