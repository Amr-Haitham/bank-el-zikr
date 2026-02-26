# بنك الذكر — Bank El Zikr

A Flutter app for tracking and performing Islamic Azkar (remembrance of Allah).

## Screens

### Home Screen
The main entry point. Displays the user's current zikr balance, quick-access cards to all azkar categories, a random prayer/dua, and a share button to invite friends.

### Zikr Counter Screen (ورد التسبيح)
A tap-based counter for performing a chosen zikr. Shows the current zikr text, a large circular tap area with a live count, a goal-setting sheet (phone vibrates on reaching the goal), and a reset button. Navigates to the Azkar selection screen to change the active zikr.

### Azkar Selection Screen (اختر الذكر)
A list of all available azkar (built-in and custom). The currently active zikr is highlighted. Users can add new custom azkar via a bottom sheet, and edit or delete existing custom ones. Selecting a zikr sets it as the active counter target.

### Morning / Night Azkar Screen (أذكار الصباح / المساء)
A full-screen reader for morning or night azkar. Displays one zikr at a time with its required repetition count, navigates forward/backward between azkar, and counts down repetitions on each tap (with optional vibration feedback).

### Situational Azkar Screen (أذكار الأحوال)
A searchable, filterable list of situational azkar (e.g. before sleep, when leaving home). Users can search by title, toggle a favorites filter, and star/unstar individual azkar. Tapping a zikr opens its full content screen.

### Zikr Content Screen
A detail screen showing the full Arabic text of a situational zikr along with its description/explanation, displayed centered for easy reading.

### Azkar Balance Screen (رصيد الذكر)
Shows the user's total cumulative zikr count alongside a Quranic verse. Includes a weekly line chart of daily zikr activity and a tabbed breakdown (daily / weekly) of counts per zikr, sorted by most recited.

### Settings Screen (الإعدادات)
Allows toggling the app theme (light/dark) and vibration feedback. Also provides buttons to support the app via a charity link and to contact the developer by email.
