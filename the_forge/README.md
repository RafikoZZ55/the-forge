# The Forge

**The Forge** is a simple single-player Flutter game created as a learning project.
Its main goal is to demonstrate a clean and practical way of using **Riverpod** for
state management and **Hive** for local persistance in one Flutter application.

The project was built entirely without AI and served as my first serious atempt
at combining Riverpod with non-primitive Hive data models.

---

## Game Concept

You step into the shoes of a **blacksmith in the 15th century**.
Your job is to repair broken tools for clients, earn money, and slowly build your
reputation over time.

As your fame grows, better clients start to apear, offering more challanging work
and higher rewards.

---

## Leveling System

The game features a **level-based progression system**.

- Completing repairs grants experience
- Gaining experience increases your **blacksmith level**
- Each new level:
  - Makes smithing easier
  - Improves efficiency
  - Unlocks new backgrounds (forges)

Higher levels represent your growing skill and reputation as a blacksmith.

---

## Backgrounds (Forges)

Backgrounds represent different **forges** you can work in.

- New backgrounds are unlocked by reaching higher levels
- Each forge provides gameplay adventages:
  - Faster repairs
  - Better efficiency
  - Improved working conditions

Progressing through backgrounds visually and mechanically reflects your journey
from a poor village blacksmith to a respected craftsman.

---

## How to Run the Project

This project is **not published on Google Play** (I cannot currently afford the
developer licence).

To run the game locally:

1. Install **Dart**
2. Install **Flutter**
3. Clone this repository
4. Run:
   ```bash
   flutter pub get
   flutter run
