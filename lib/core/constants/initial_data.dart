import 'package:bank_el_ziker/core/domain/entities/zikr.dart';
import 'package:bank_el_ziker/core/domain/entities/zikr_category.dart';
import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/features/home/domain/entities/prayer.dart';
import 'package:flutter/material.dart';

class InitialData {
  static List<ZikrEntity> generalAzkar = [
    const ZikrEntity(
        id: 1,
        key: 'general_001',
        category: 'general',
        content: "سبحان الله",
        contentTransliteration: "Subhan Allah",
        contentEn: "Glory be to Allah",
        descriptionEn:
            "The Prophet ﷺ said: Is any of you unable to earn a thousand good deeds a day? Whoever glorifies Allah a hundred times, a thousand good deeds are recorded for him, or a thousand of his sins are wiped away. (Muslim)",
        description:
            "قال رَسُولَ اللَّهِ ﷺ: ( أَيَعْجِزُ أَحَدُكُمْ أَنْ يَكْسِبَ كُلَّ يَومٍ أَلْفَ حَسَنَةٍ؟ فَسَأَلَهُ سَائِلٌ مِن جُلَسَائِهِ: كيفَ يَكْسِبُ أَحَدُنَا أَلْفَ حَسَنَةٍ؟ قالَ: يُسَبِّحُ مِائَةَ تَسْبِيحَةٍ، فيُكْتَبُ له أَلْفُ حَسَنَةٍ، أَوْ يُحَطُّ عنْه أَلْفُ خَطِيئَةٍ). رواه مسلم"),
    const ZikrEntity(
        id: 2,
        key: 'general_002',
        category: 'general',
        content: "الحمد لله",
        contentTransliteration: "Alhamdu lillah",
        contentEn: "Praise be to Allah",
        descriptionEn:
            "Allah says: If you are grateful, I will surely increase you (in favor). (Ibrahim 7). And the Prophet ﷺ said: Purity is half of faith, and \"Praise be to Allah\" fills the scale. (Muslim)",
        description:
            "قال الله تعالى: (وَإِذْ تَأَذَّنَ رَبُّكُمْ لَئِن شَكَرْتُمْ لَأَزِيدَنَّكُمْ ۖ وَلَئِن كَفَرْتُمْ إِنَّ عَذَابِي لَشَدِيدٌ). ابراهيم 7.و قال رَسُولَ اللَّهِ ﷺ: (الطُّهُورُ شَطْرُ الإيمانِ، والْحَمْدُ لِلَّهِ تَمْلأُ المِيزانَ). رواه مسلم"),
    const ZikrEntity(
        id: 3,
        key: 'general_003',
        category: 'general',
        content: "لا إله إلا الله",
        contentTransliteration: "La ilaha illa Allah",
        contentEn: "There is no god but Allah",
        descriptionEn:
            "The Prophet ﷺ said: Allah has forbidden the Fire for whoever says \"There is no god but Allah\", seeking thereby the Face of Allah. (Agreed upon)",
        description:
            "قال رسول الله ﷺ: (فإنَّ اللَّهَ قدْ حَرَّمَ علَى النَّارِ مَن قالَ: لا إلَهَ إلَّا اللَّهُ، يَبْتَغِي بذلكَ وجْهَ اللَّهِ). متفق عليه"),
    const ZikrEntity(
        id: 4,
        key: 'general_004',
        category: 'general',
        content: "الله أكبر",
        contentTransliteration: "Allahu Akbar",
        contentEn: "Allah is the Greatest",
        descriptionEn:
            "Takbeer is an affirmation and declaration of Allah's greatness and the glorification of His signs. Allah says: \"And magnify your Lord.\" (Al-Muddaththir 3)",
        description:
            "التكبير جزم وإعلان عن عظمة الله وتعظيم لشعائره. قال الله تعالى: (وَرَبَّكَ فَكَبِّرْ). المدثر 3. و قال: (وَقُلِ اِلْحَمْدُ لِلَّهِ اِلذِي لَمْ يَتَّخِذْ وَلَدًا وَلَمْ يَكُن لَّهُ شَرِيكٌ فِي اِلْمُلْكِ وَلَمْ يَكُن لَّهُ وَلِيٌّ مِّنَ اَلذُّلِّ. وَكَبِّرْهُ تَكْبِيرًا). الإسراء 111"),
    const ZikrEntity(
        id: 5,
        key: 'general_005',
        category: 'general',
        content: "سبحان الله والحمد لله ولا إله إلا الله و الله أكبر",
        contentTransliteration:
            "Subhan Allah, wal hamdu lillah, wa la ilaha illa Allah, wa Allahu Akbar",
        contentEn:
            "Glory be to Allah, praise be to Allah, there is no god but Allah, and Allah is the Greatest",
        descriptionEn:
            "These four phrases combined. The Prophet ﷺ said: The most beloved words to Allah are four: \"Glory be to Allah, praise be to Allah, there is no god but Allah, and Allah is the Greatest.\" (Muslim)",
        description:
            "الأذكار السابقة مجمعة. قال فيهن النبي ﷺ الكثير من الأحاديث. فقال ﷺ : (أَحَبُّ الكَلامِ إلى اللهِ أرْبَعٌ: سُبْحانَ اللهِ، والْحَمْدُ لِلَّهِ، ولا إلَهَ إلَّا اللَّهُ، واللَّهُ أكْبَرُ) رواه مسلم. و قال: ( لَأنْ أقولَ : سُبحانَ اللهِ والحمدُ للهِ ولا إلهَ إلَّا اللهُ واللهُ أكبَرُ أحَبُّ إليَّ ممَّا طلَعَتْ عليه الشَّمسُ). رواه ابن حبان"),
    const ZikrEntity(
        id: 6,
        key: 'general_006',
        category: 'general',
        content: "سبحان الله وبحمده",
        contentTransliteration: "Subhan Allahi wa bihamdih",
        contentEn: "Glory be to Allah and praise Him",
        descriptionEn:
            "The Prophet ﷺ said: Whoever says \"Glory be to Allah and praise Him\" a hundred times a day, his sins are wiped away even if they are like the foam of the sea. (Tirmidhi)",
        description:
            "في حديث أبي هريرة يقول رسول الله ﷺ: (من قال : سبحان اللهِ وبحمدِه مائةَ مرةٍ غُفرَتْ له ذنوبُه وإنْ كانتْ مثلَ زبَدِ البحرِ). رواه الترمذي"),
    const ZikrEntity(
        id: 7,
        key: 'general_007',
        category: 'general',
        content: "أستغفر الله",
        contentTransliteration: "Astaghfirullah",
        contentEn: "I seek forgiveness from Allah",
        descriptionEn:
            "Allah says: \"Seek forgiveness from your Lord; indeed, He is ever a Perpetual Forgiver. He will send [rain from] the sky upon you in showers and give you increase in wealth and children.\" (Nuh 10-12)",
        description:
            "قال الله عز وجل: (فَقُلْتُ اسْتَغْفِرُوا رَبَّكُمْ إِنَّهُ كَانَ غَفَّارًا*يُرْسِلِ السَّمَاءَ عَلَيْكُم مِّدْرَارًا*وَيُمْدِدْكُم بِأَمْوَالٍ وَبَنِينَ وَيَجْعَل لَّكُمْ جَنَّاتٍ وَيَجْعَل لَّكُمْ أَنْهَارًا). سورة نوح : 10 - 12"),
    const ZikrEntity(
        id: 8,
        key: 'general_008',
        category: 'general',
        content: "حسبي الله ونعم الوكيل",
        contentTransliteration: "Hasbunallahu wa ni'mal wakeel",
        contentEn:
            "Allah is sufficient for us, and He is the best disposer of affairs",
        descriptionEn:
            "Allah says: Those to whom the people said, \"The people have gathered against you, so fear them.\" But it increased them in faith, and they said, \"Allah is sufficient for us, and He is the best disposer of affairs.\" (Aal-Imran 173-174)",
        description:
            "يقول الله تعالى: ( الَّذِينَ قَالَ لَهُمُ النَّاسُ إِنَّ النَّاسَ قَدْ جَمَعُواْ لَكُمْ فَاخْشَوْهُمْ فَزَادَهُمْ إِيمَاناً وَقَالُواْ حَسْبُنَا اللّهُ وَنِعْمَ الْوَكِيلُ. فَانقَلَبُواْ بِنِعْمَةٍ مِّنَ اللّهِ وَفَضْلٍ لَّمْ يَمْسَسْهُمْ سُوءٌ وَاتَّبَعُواْ رِضْوَانَ اللّهِ ).  سورة آل عمران : 173 – 174"),
    const ZikrEntity(
        id: 9,
        key: 'general_009',
        category: 'general',
        content: "لا إله إلا أنت سبحانك إني كنت من الظالمين",
        contentTransliteration:
            "La ilaha illa anta subhanaka inni kuntu minaz-zalimin",
        contentEn:
            "There is no god but You, glory be to You, I have indeed been of the wrongdoers",
        descriptionEn:
            "The Prophet ﷺ said: The supplication of Dhun-Nun (Yunus) when he called upon Allah while in the belly of the whale was: \"There is no god but You, glory be to You, I have indeed been of the wrongdoers.\" No Muslim ever supplicates with it except that Allah answers him. (Tirmidhi)",
        description:
            "قال رسول الله ﷺ:(دعوةُ ذي النُّونِ إذ دعا وهو في بطنِ الحوتِ لا إلهَ إلَّا أنتَ سبحانَك إنِّي كنتُ من الظالمينَ فإنَّه لم يدعُ بها رجلٌ مسلمٌ في شيءٍ قطُّ إلَّا استجاب اللهُ له). رواه الترمذي"),
    const ZikrEntity(
        id: 10,
        key: 'general_010',
        category: 'general',
        content: "اللهم صل على سيدنا محمد",
        contentTransliteration: "Allahumma salli ala sayyidina Muhammad",
        contentEn: "O Allah, send blessings upon our master Muhammad",
        descriptionEn:
            "Abu Hurairah reported that the Messenger of Allah ﷺ said: Whoever sends one blessing upon me, Allah will send ten blessings upon him. (Muslim)",
        description:
            "عَنْ أَبِي هُرَيْرَةَ،أَنَّ رَسُولَ اللهِ ﷺ قَالَ: (مَنْ صَلَّى عَلَيَّ وَاحِدَةً صَلَّى الله عَلَيْهِ عَشْرًا). رواه مسلم"),
    const ZikrEntity(
        id: 11,
        key: 'general_011',
        category: 'general',
        content:
            "لا إله إلا الله وحده لا شريك له له الملك وله الحمد وهو على كل شيء قدير",
        contentTransliteration:
            "La ilaha illa Allah wahdahu la sharika lah, lahul mulku wa lahul hamdu wa huwa ala kulli shay'in qadir",
        contentEn:
            "There is no god but Allah, alone, without partner; His is the dominion and His is the praise, and He is over all things competent",
        descriptionEn:
            "Abu Hurairah reported the Messenger of Allah ﷺ saying: Whoever says \"There is no god but Allah, alone, without partner; His is the dominion and His is the praise, and He is over all things competent\" a hundred times in a day, it is equal to freeing ten slaves, a hundred good deeds are recorded for him, a hundred bad deeds are wiped away from him, and it is a protection from Satan for that day until evening. (Bukhari)",
        description:
            "في حديث أبي هريرة يقول رسول الله ﷺ:(لا إلَهَ إلَّا اللَّهُ، وحْدَهُ لا شَرِيكَ له، له المُلْكُ وله الحَمْدُ، وهو علَى كُلِّ شَيءٍ قَدِيرٌ، في يَومٍ مِئَةَ مَرَّةٍ؛ كانَتْ له عَدْلَ عَشْرِ رِقابٍ، وكُتِبَتْ له مِئَةُ حَسَنَةٍ، ومُحِيَتْ عنْه مِئَةُ سَيِّئَةٍ، وكانَتْ له حِرْزًا مِنَ الشَّيْطانِ يَومَهُ ذلكَ حتَّى يُمْسِيَ، ولَمْ يَأْتِ أحَدٌ بأَفْضَلَ ممَّا جاءَ به، إلَّا أحَدٌ عَمِلَ أكْثَرَ مِن ذلكَ). رواه البخاري"),
    const ZikrEntity(
        id: 12,
        key: 'general_012',
        category: 'general',
        content: "سبحان الله وبحمده، سبحان الله العظيم",
        contentTransliteration:
            "Subhan Allahi wa bihamdih, Subhan Allahil azim",
        contentEn:
            "Glory be to Allah and praise Him, glory be to Allah the Almighty",
        descriptionEn:
            "The Prophet ﷺ said: Two phrases that are light on the tongue, heavy on the scale, and beloved to the Most Merciful: \"Glory be to Allah and praise Him, glory be to Allah the Almighty.\" (Agreed upon)",
        description:
            "قال النبي ﷺ: (كَلِمَتانِ خَفِيفَتانِ علَى اللِّسانِ، ثَقِيلَتانِ في المِيزانِ، حَبِيبَتانِ إلى الرَّحْمَنِ، سُبْحانَ اللَّهِ وبِحَمْدِهِ، سُبْحانَ اللَّهِ العَظِيمِ). متفق عليه"),
    const ZikrEntity(
        id: 13,
        key: 'general_013',
        category: 'general',
        content: "لا حول ولا قوة إلا بالله",
        contentTransliteration: "La hawla wa la quwwata illa billah",
        contentEn: "There is no might nor power except with Allah",
        descriptionEn:
            "The Prophet ﷺ said to Abu Musa al-Ash'ari: Shall I not guide you to a treasure from the treasures of Paradise? \"There is no might nor power except with Allah.\" (Agreed upon)",
        description:
            "قال النبي ﷺ لأبي موسى الأشعري: (أَلَا أَدُلُّكَ عَلَى كَنْزٍ مِنْ كُنُوزِ الْجَنَّةِ؟ لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ). مُتَّفَقٌ عَلَيْهِ"),
  ];

  static List<ZikrEntity> morningAzkar = [
    const ZikrEntity(
        id: 1,
        key: 'morning_001',
        category: 'morning',
        content: """
أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ  بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيم {اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ} [آية الكرسى - البقرة 255]. """,
        count: 1,
        description: null,
        title: 'آية الكرسى',
        source: 'آية الكرسى',
        contentTransliteration:
            "Allāhu lā ilāha illā huwa, al-ḥayyu al-qayyūm. Lā ta'khudhuhu sinatun wa lā nawm. Lahu mā fis-samāwāti wa mā fil-arḍ. Man dhal-ladhī yashfa'u 'indahu illā bi-idhnih. Ya'lamu mā bayna aydīhim wa mā khalfahum, wa lā yuḥīṭūna bishay'im min 'ilmihi illā bimā shā'. Wasi'a kursiyyuhus-samāwāti wal-arḍ, wa lā ya'ūduhu ḥifẓuhumā, wa huwal-'aliyyul-'aẓīm.",
        contentEn:
            "Allah - there is no deity except Him, the Ever-Living, the Sustainer of existence. Neither drowsiness overtakes Him nor sleep. To Him belongs whatever is in the heavens and whatever is on the earth. Who is it that can intercede with Him except by His permission? He knows what is before them and what will be after them, and they encompass not a thing of His knowledge except for what He wills. His Kursi extends over the heavens and the earth, and their preservation tires Him not. And He is the Most High, the Most Great."),
    const ZikrEntity(
        id: 2,
        key: 'morning_002',
        category: 'morning',
        content: """بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
قُلْ هُوَ ٱللَّهُ أَحَدٌ، ٱللَّهُ ٱلصَّمَدُ، لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُن لَّهُۥ كُفُوًا أَحَدٌۢ""",
        count: 3,
        description: null,
        title: 'سورة الإخلاص',
        source: 'سورة الإخلاص',
        contentTransliteration:
            "Qul huwa Allāhu aḥad, Allāhuṣ-ṣamad, lam yalid wa lam yūlad, wa lam yakun lahu kufuwan aḥad.",
        contentEn:
            "Say: He is Allah, the One. Allah, the Eternal Refuge. He neither begets nor is born, nor is there to Him any equivalent."),
    const ZikrEntity(
        id: 3,
        key: 'morning_003',
        category: 'morning',
        content: """بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
قُلْ أَعُوذُ بِرَبِّ ٱلْفَلَقِ، مِن شَرِّ مَا خَلَقَ، وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ، وَمِن شَرِّ ٱلنَّفَّٰثَٰتِ فِى ٱلْعُقَدِ، وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ""",
        count: 3,
        title: 'سورة الفلق',
        description: null,
        source: 'سورة الفلق',
        contentTransliteration:
            "Qul a'ūdhu birabbil-falaq, min sharri mā khalaq, wa min sharri ghāsiqin idhā waqab, wa min sharrin-naffāthāti fil-'uqad, wa min sharri ḥāsidin idhā ḥasad.",
        contentEn:
            "Say: I seek refuge in the Lord of daybreak, from the evil of that which He created, and from the evil of darkness when it settles, and from the evil of the blowers in knots, and from the evil of an envier when he envies."),
    const ZikrEntity(
        id: 4,
        key: 'morning_004',
        category: 'morning',
        content: """بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ، مَلِكِ ٱلنَّاسِ، إِلَٰهِ ٱلنَّاسِ، مِن شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ، ٱلَّذِى يُوَسْوِسُ فِى صُدُورِ ٱلنَّاسِ، مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ.""",
        count: 3,
        title: 'سورة الناس',
        description: null,
        source: 'سورة الناس',
        contentTransliteration:
            "Qul a'ūdhu birabbin-nās, malikin-nās, ilāhin-nās, min sharril-waswāsil-khannās, alladhī yuwaswisu fī ṣudūrin-nās, minal-jinnati wan-nās.",
        contentEn:
            "Say: I seek refuge in the Lord of mankind, the Sovereign of mankind, the God of mankind, from the evil of the retreating whisperer who whispers [evil] into the breasts of mankind, from among the jinn and mankind."),
    const ZikrEntity(
        id: 5,
        key: 'morning_005',
        category: 'morning',
        content:
            """أَصْـبَحْنا وَأَصْـبَحَ المُـلْكُ لله وَالحَمدُ لله ، لا إلهَ إلاّ اللّهُ وَحدَهُ لا شَريكَ لهُ، لهُ المُـلكُ ولهُ الحَمْـد، وهُوَ على كلّ شَيءٍ قدير ، رَبِّ أسْـأَلُـكَ خَـيرَ ما في هـذا اليوم وَخَـيرَ ما بَعْـدَه ، وَأَعـوذُ بِكَ مِنْ شَـرِّ ما في هـذا اليوم وَشَرِّ ما بَعْـدَه، رَبِّ أَعـوذُبِكَ مِنَ الْكَسَـلِ وَسـوءِ الْكِـبَر ، رَبِّ أَعـوذُ بِكَ مِنْ عَـذابٍ في النّـارِ وَعَـذابٍ في القَـبْر.""",
        count: 1,
        contentTransliteration:
            "Asbahna wa asbaha al-mulku lillah, wal-hamdu lillah, la ilaha illallahu wahdahu la sharika lah, lahul-mulku wa lahul-hamdu wa huwa 'ala kulli shay'in qadir. Rabbi as'aluka khayra ma fi hadhal-yawmi wa khayra ma ba'dah, wa a'udhu bika min sharri ma fi hadhal-yawmi wa sharri ma ba'dah. Rabbi a'udhu bika minal-kasali wa su'il-kibar. Rabbi a'udhu bika min 'adhabin fin-nari wa 'adhabin fil-qabr.",
        contentEn:
            "We have reached the morning and at this very time all sovereignty belongs to Allah, and all praise is for Allah. None has the right to be worshipped except Allah, alone, without partner, to Him belongs all sovereignty and praise and He is over all things omnipotent. My Lord, I ask You for the good of this day and the good of what follows it and I take refuge in You from the evil of this day and the evil of what follows it. My Lord, I take refuge in You from laziness and senility. My Lord, I take refuge in You from torment in the Fire and punishment in the grave."),
    const ZikrEntity(
        id: 6,
        key: 'morning_006',
        category: 'morning',
        title: 'سيد الاستغفار',
        titleEn: "The Master of Seeking Forgiveness",
        content:
            """اللّهـمَّ أَنْتَ رَبِّـي لا إلهَ إلاّ أَنْتَ ، خَلَقْتَنـي وَأَنا عَبْـدُك ، وَأَنا عَلـى عَهْـدِكَ وَوَعْـدِكَ ما اسْتَـطَعْـت ، أَعـوذُبِكَ مِنْ شَـرِّ ما صَنَـعْت ، أَبـوءُ لَـكَ بِنِعْـمَتِـكَ عَلَـيَّ وَأَبـوءُ بِذَنْـبي فَاغْفـِرْ لي فَإِنَّـهُ لا يَغْـفِرُ الذُّنـوبَ إِلاّ أَنْتَ """,
        count: 1,
        contentTransliteration:
            "Allahumma anta rabbi la ilaha illa ant, khalaqtani wa ana 'abduk, wa ana 'ala 'ahdika wa wa'dika mastata't, a'udhu bika min sharri ma sana't, abu'u laka bini'matika 'alayya wa abu'u bidhanbi faghfir li fa'innahu la yaghfirudh-dhunuba illa ant.",
        contentEn:
            "O Allah, You are my Lord, none has the right to be worshipped except You. You created me and I am Your servant, and I abide by Your covenant and promise as best I can. I take refuge in You from the evil of what I have done. I acknowledge Your favor upon me, and I acknowledge my sin, so forgive me, for none forgives sins except You."),
    const ZikrEntity(
        id: 7,
        key: 'morning_007',
        category: 'morning',
        content:
            """رَضيـتُ بِاللهِ رَبَّـاً وَبِالإسْلامِ ديـناً وَبِمُحَـمَّدٍ صلى الله عليه وسلم نَبِيّـاً.""",
        count: 3,
        contentTransliteration:
            "Radhitu billahi rabban, wa bil-Islami dinan, wa bi-Muhammadin sallallahu 'alayhi wa sallama nabiyya.",
        contentEn:
            "I am pleased with Allah as my Lord, with Islam as my religion and with Muhammad ﷺ as my Prophet."),
    const ZikrEntity(
        id: 8,
        key: 'morning_008',
        category: 'morning',
        content:
            """اللّهُـمَّ إِنِّـي أَصْبَـحْتُ أُشْـهِدُك ، وَأُشْـهِدُ حَمَلَـةَ عَـرْشِـك ، وَمَلَائِكَتَكَ ، وَجَمـيعَ خَلْـقِك ، أَنَّـكَ أَنْـتَ اللهُ لا إلهَ إلاّ أَنْـتَ وَحْـدَكَ لا شَريكَ لَـك ، وَأَنَّ مُحَمّـداً عَبْـدُكَ وَرَسـولُـك.""",
        count: 4,
        contentTransliteration:
            "Allahumma inni asbahtu ush-hiduka, wa ush-hidu hamalata 'arshik, wa mala'ikataka, wa jami'a khalqik, annaka antallahu la ilaha illa anta wahdaka la sharika lak, wa anna Muhammadan 'abduka wa rasuluk.",
        contentEn:
            "O Allah, I have reached the morning and call upon You, the bearers of Your Throne, Your angels and all creation to witness that You are Allah, none has the right to be worshipped except You alone, without partner, and that Muhammad is Your servant and Messenger."),
    const ZikrEntity(
        id: 9,
        key: 'morning_009',
        category: 'morning',
        content:
            """اللّهُـمَّ ما أَصْبَـَحَ بي مِـنْ نِعْـمَةٍ أَو بِأَحَـدٍ مِـنْ خَلْـقِك ، فَمِـنْكَ وَحْـدَكَ لا شريكَ لَـك ، فَلَـكَ الْحَمْـدُ وَلَـكَ الشُّكْـر.""",
        count: 1,
        contentTransliteration:
            "Allahumma ma asbaha bi min ni'matin aw bi-ahadin min khalqik, faminka wahdaka la sharika lak, falakal-hamdu wa lakash-shukr.",
        contentEn:
            "O Allah, whatever blessing I or any of Your creation have risen upon, is from You alone, without partner, so for You is all praise and unto You all thanks."),
    const ZikrEntity(
        id: 10,
        key: 'morning_010',
        category: 'morning',
        content: """
حَسْبِـيَ اللّهُ لا إلهَ إلاّ هُوَ عَلَـيهِ تَوَكَّـلتُ وَهُوَ رَبُّ العَرْشِ العَظـيم. """,
        count: 7,
        contentTransliteration:
            "Hasbiyallahu la ilaha illa huwa, 'alayhi tawakkaltu wa huwa rabbul-'arshil-'azim.",
        contentEn:
            "Allah is sufficient for me, none has the right to be worshipped except Him, upon Him I rely, and He is Lord of the mighty Throne."),
    const ZikrEntity(
        id: 11,
        key: 'morning_011',
        category: 'morning',
        content:
            """بِسـمِ اللهِ الذي لا يَضُـرُّ مَعَ اسمِـهِ شَيءٌ في الأرْضِ وَلا في السّمـاءِ وَهـوَ السّمـيعُ العَلـيم.""",
        count: 3,
        description: "لم يضره من الله شيء.",
        descriptionEn: "Nothing will harm him.",
        contentTransliteration:
            "Bismillahilladhi la yadhurru ma'as-mihi shay'un fil-ardi wa la fis-sama'i wa huwas-sami'ul-'alim.",
        contentEn:
            "In the name of Allah, with whose name nothing on earth or in heaven can cause harm, and He is the All-Hearing, the All-Knowing."),
    const ZikrEntity(
        id: 12,
        key: 'morning_012',
        category: 'morning',
        content:
            """اللّهُـمَّ بِكَ أَصْـبَحْنا وَبِكَ أَمْسَـينا ، وَبِكَ نَحْـيا وَبِكَ نَمُـوتُ وَإِلَـيْكَ النُّـشُور. """,
        count: 1,
        contentTransliteration:
            "Allahumma bika asbahna, wa bika amsayna, wa bika nahya, wa bika namutu wa ilaykan-nushur.",
        contentEn:
            "O Allah, by You we enter the morning and by You we enter the evening, by You we live and by You we die, and to You is the resurrection."),
    const ZikrEntity(
        id: 13,
        key: 'morning_013',
        category: 'morning',
        content:
            """أَصْبَـحْـنا عَلَى فِطْرَةِ الإسْلاَمِ، وَعَلَى كَلِمَةِ الإِخْلاَصِ، وَعَلَى دِينِ نَبِيِّنَا مُحَمَّدٍ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ، وَعَلَى مِلَّةِ أَبِينَا إبْرَاهِيمَ حَنِيفاً مُسْلِماً وَمَا كَانَ مِنَ المُشْرِكِينَ. """,
        count: 1,
        contentTransliteration:
            "Asbahna 'ala fitratil-Islam, wa 'ala kalimatil-ikhlas, wa 'ala dini nabiyyina Muhammadin sallallahu 'alayhi wa sallam, wa 'ala millati abina Ibrahima hanifan musliman wa ma kana minal-mushrikin.",
        contentEn:
            "We have risen upon the natural religion of Islam, the word of sincere devotion, the religion of our Prophet Muhammad ﷺ, and the way of our father Abraham, who was upright in submission and was not of those who associate partners with Allah."),
    const ZikrEntity(
        id: 14,
        key: 'morning_014',
        category: 'morning',
        content:
            """سُبْحـانَ اللهِ وَبِحَمْـدِهِ عَدَدَ خَلْـقِه ، وَرِضـا نَفْسِـه ، وَزِنَـةَ عَـرْشِـه ، وَمِـدادَ كَلِمـاتِـه.  """,
        count: 3,
        contentTransliteration:
            "Subhanallahi wa bihamdihi, 'adada khalqihi, wa ridha nafsihi, wa zinata 'arshihi, wa midada kalimatih.",
        contentEn:
            "Glory is to Allah and praise is to Him, by the number of His creation, in accordance with His pleasure, by the weight of His Throne, and equal to the ink of His words."),
    const ZikrEntity(
        id: 15,
        key: 'morning_015',
        category: 'morning',
        content:
            """اللّهُـمَّ عافِـني في بَدَنـي ، اللّهُـمَّ عافِـني في سَمْـعي ، اللّهُـمَّ عافِـني في بَصَـري ، لا إلهَ إلاّ أَنْـتَ.  """,
        count: 3,
        contentTransliteration:
            "Allahumma 'afini fi badani, Allahumma 'afini fi sam'i, Allahumma 'afini fi basari, la ilaha illa ant.",
        contentEn:
            "O Allah, grant my body health. O Allah, grant my hearing health. O Allah, grant my sight health. None has the right to be worshipped except You."),
    const ZikrEntity(
        id: 16,
        key: 'morning_016',
        category: 'morning',
        content:
            """اللّهُـمَّ إِنّـي أَعـوذُ بِكَ مِنَ الْكُـفر ، وَالفَـقْر ، وَأَعـوذُ بِكَ مِنْ عَذابِ القَـبْر ، لا إلهَ إلاّ أَنْـتَ.""",
        count: 3,
        contentTransliteration:
            "Allahumma inni a'udhu bika minal-kufri, wal-faqri, wa a'udhu bika min 'adhabil-qabri, la ilaha illa ant.",
        contentEn:
            "O Allah, I take refuge in You from disbelief and poverty, and I take refuge in You from the punishment of the grave. None has the right to be worshipped except You."),
    const ZikrEntity(
        id: 17,
        key: 'morning_017',
        category: 'morning',
        content:
            """اللّهُـمَّ إِنِّـي أسْـأَلُـكَ العَـفْوَ وَالعـافِـيةَ في الدُّنْـيا وَالآخِـرَة ، اللّهُـمَّ إِنِّـي أسْـأَلُـكَ العَـفْوَ وَالعـافِـيةَ في ديني وَدُنْـيايَ وَأهْـلي وَمالـي ، اللّهُـمَّ اسْتُـرْ عـوْراتي وَآمِـنْ رَوْعاتـي ، اللّهُـمَّ احْفَظْـني مِن بَـينِ يَدَيَّ وَمِن خَلْفـي وَعَن يَمـيني وَعَن شِمـالي ، وَمِن فَوْقـي ، وَأَعـوذُ بِعَظَمَـتِكَ أَن أُغْـتالَ مِن تَحْتـي.""",
        count: 1,
        contentTransliteration:
            "Allahumma inni as'alukal-'afwa wal-'afiyata fid-dunya wal-akhirah, Allahumma inni as'alukal-'afwa wal-'afiyata fi dini wa dunyaya wa ahli wa mali, Allahummastur 'awrati wa amin raw'ati, Allahummahfazni min bayni yadayya wa min khalfi wa 'an yamini wa 'an shimali wa min fawqi, wa a'udhu bi'azamatika an ughtala min tahti.",
        contentEn:
            "O Allah, I ask You for pardon and well-being in this life and the next. O Allah, I ask You for pardon and well-being in my religious and worldly affairs, and my family and my wealth. O Allah, veil my faults and calm my fears. O Allah, guard me from before me and behind me, from my right and my left, and from above me, and I take refuge in Your greatness from being taken unaware from beneath me."),
    const ZikrEntity(
        id: 18,
        key: 'morning_018',
        category: 'morning',
        content:
            """يَا حَيُّ يَا قيُّومُ بِرَحْمَتِكَ أسْتَغِيثُ أصْلِحْ لِي شَأنِي كُلَّهُ وَلاَ تَكِلْنِي إلَى نَفْسِي طَـرْفَةَ عَيْنٍ. """,
        count: 3,
        contentTransliteration:
            "Ya hayyu ya qayyumu birahmatika astaghith, aslih li sha'ni kullah, wa la takilni ila nafsi tarfata 'ayn.",
        contentEn:
            "O Ever-Living, O Self-Subsisting and Supporter of all, by Your mercy I seek relief. Rectify all my affairs and do not leave me to myself, even for the blink of an eye."),
    const ZikrEntity(
        id: 19,
        key: 'morning_019',
        category: 'morning',
        content:
            """أَصْبَـحْـنا وَأَصْبَـحْ المُـلكُ للهِ رَبِّ العـالَمـين ، اللّهُـمَّ إِنِّـي أسْـأَلُـكَ خَـيْرَ هـذا الـيَوْم ، فَـتْحَهُ ، وَنَصْـرَهُ ، وَنـورَهُ وَبَـرَكَتَـهُ ، وَهُـداهُ ، وَأَعـوذُ بِـكَ مِـنْ شَـرِّ ما فـيهِ وَشَـرِّ ما بَعْـدَه. """,
        count: 1,
        contentTransliteration:
            "Asbahna wa asbahal-mulku lillahi rabbil-'alamin. Allahumma inni as'aluka khayra hadhal-yawm: fathahu wa nasrahu wa nurahu wa barakatahu wa hudahu, wa a'udhu bika min sharri ma fihi wa sharri ma ba'dah.",
        contentEn:
            "We have reached the morning and at this very time all sovereignty belongs to Allah, Lord of the worlds. O Allah, I ask You for the good of this day: its triumph, its help, its light, its blessings, and its guidance, and I take refuge in You from the evil in it and the evil that follows it."),
    const ZikrEntity(
        id: 20,
        key: 'morning_020',
        category: 'morning',
        content:
            """اللّهُـمَّ عالِـمَ الغَـيْبِ وَالشّـهادَةِ فاطِـرَ السّماواتِ وَالأرْضِ رَبَّ كـلِّ شَـيءٍ وَمَليـكَه ، أَشْهَـدُ أَنْ لا إِلـهَ إِلاّ أَنْت ، أَعـوذُ بِكَ مِن شَـرِّ نَفْسـي وَمِن شَـرِّ الشَّيْـطانِ وَشِرْكِهِ ، وَأَنْ أَقْتَـرِفَ عَلـى نَفْسـي سوءاً أَوْ أَجُـرَّهُ إِلـى مُسْـلِم. """,
        count: 1,
        contentTransliteration:
            "Allahumma 'alimal-ghaybi wash-shahadati fatiras-samawati wal-ard, rabba kulli shay'in wa malikah, ash-hadu an la ilaha illa ant, a'udhu bika min sharri nafsi wa min sharrish-shaytani wa shirkih, wa an aqtarifa 'ala nafsi su'an aw ajurrahu ila muslim.",
        contentEn:
            "O Allah, Knower of the unseen and the seen, Creator of the heavens and the earth, Lord and Sovereign of all things, I bear witness that none has the right to be worshipped except You. I take refuge in You from the evil of my soul and from the evil and shirk of Satan, and from committing wrong against myself or bringing such upon another Muslim."),
    const ZikrEntity(
        id: 21,
        key: 'morning_021',
        category: 'morning',
        content:
            """أَعـوذُ بِكَلِمـاتِ اللّهِ التّـامّـاتِ مِنْ شَـرِّ ما خَلَـق. """,
        count: 3,
        contentTransliteration:
            "A'udhu bikalimatillahit-tammati min sharri ma khalaq.",
        contentEn:
            "I take refuge in the perfect words of Allah from the evil of what He has created."),
    const ZikrEntity(
        id: 22,
        key: 'morning_022',
        category: 'morning',
        content:
            """اللَّهُمَّ صَلِّ وَسَلِّمْ وَبَارِكْ على نَبِيِّنَا مُحمَّد. """,
        count: 10,
        contentTransliteration:
            "Allahumma salli wa sallim wa barik 'ala nabiyyina Muhammad.",
        contentEn:
            "O Allah, send prayers, peace, and blessings upon our Prophet Muhammad."),
    const ZikrEntity(
        id: 23,
        key: 'morning_023',
        category: 'morning',
        content:
            """اللَّهُمَّ إِنَّا نَعُوذُ بِكَ مِنْ أَنْ نُشْرِكَ بِكَ شَيْئًا نَعْلَمُهُ ، وَنَسْتَغْفِرُكَ لِمَا لَا نَعْلَمُهُ. """,
        count: 3,
        contentTransliteration:
            "Allahumma inna na'udhu bika an nushrika bika shay'an na'lamuh, wa nastaghfiruka lima la na'lamuh.",
        contentEn:
            "O Allah, we take refuge in You from associating anything with You knowingly, and we seek Your forgiveness for that which we do not know."),
    const ZikrEntity(
        id: 24,
        key: 'morning_024',
        category: 'morning',
        content:
            """اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ الْهَمِّ وَالْحَزَنِ، وَأَعُوذُ بِكَ مِنْ الْعَجْزِ وَالْكَسَلِ، وَأَعُوذُ بِكَ مِنْ الْجُبْنِ وَالْبُخْلِ، وَأَعُوذُ بِكَ مِنْ غَلَبَةِ الدَّيْنِ، وَقَهْرِ الرِّجَالِ.  """,
        count: 3,
        contentTransliteration:
            "Allahumma inni a'udhu bika minal-hammi wal-hazan, wal-'ajzi wal-kasal, wal-jubni wal-bukhl, wa ghalabatid-dayni wa qahrir-rijal.",
        contentEn:
            "O Allah, I take refuge in You from anxiety and sorrow, weakness and laziness, cowardice and miserliness, the burden of debts and being overpowered by men."),
    const ZikrEntity(
        id: 25,
        key: 'morning_025',
        category: 'morning',
        content:
            """أسْتَغْفِرُ اللهَ العَظِيمَ الَّذِي لاَ إلَهَ إلاَّ هُوَ، الحَيُّ القَيُّومُ، وَأتُوبُ إلَيهِ.  """,
        count: 3,
        contentTransliteration:
            "Astaghfirullahal-'azimalladhi la ilaha illa huwal-hayyul-qayyumu wa atubu ilayh.",
        contentEn:
            "I seek the forgiveness of Allah, the Mighty, whom there is none worthy of worship except Him, the Ever-Living, the Self-Subsisting, and I repent unto Him."),
    const ZikrEntity(
        id: 26,
        key: 'morning_026',
        category: 'morning',
        content:
            """يَا رَبِّ , لَكَ الْحَمْدُ كَمَا يَنْبَغِي لِجَلَالِ وَجْهِكَ , وَلِعَظِيمِ سُلْطَانِكَ. """,
        count: 3,
        contentTransliteration:
            "Ya rabbi, lakal-hamdu kama yanbaghi lijalali wajhika wa 'azimi sultanik.",
        contentEn:
            "O my Lord, praise be to You as befits the majesty of Your Face and the greatness of Your power."),
    const ZikrEntity(
        id: 27,
        key: 'morning_027',
        category: 'morning',
        content:
            """اللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا، وَرِزْقًا طَيِّبًا، وَعَمَلًا مُتَقَبَّلًا. """,
        count: 1,
        contentTransliteration:
            "Allahumma inni as'aluka 'ilman nafi'an, wa rizqan tayyiban, wa 'amalan mutaqabbala.",
        contentEn:
            "O Allah, I ask You for beneficial knowledge, good provision, and acceptable deeds."),
    const ZikrEntity(
        id: 28,
        key: 'morning_028',
        category: 'morning',
        content:
            """اللَّهُمَّ أَنْتَ رَبِّي لا إِلَهَ إِلا أَنْتَ ، عَلَيْكَ تَوَكَّلْتُ ، وَأَنْتَ رَبُّ الْعَرْشِ الْعَظِيمِ , مَا شَاءَ اللَّهُ كَانَ ، وَمَا لَمْ يَشَأْ لَمْ يَكُنْ ، وَلا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ الْعَلِيِّ الْعَظِيمِ , أَعْلَمُ أَنَّ اللَّهَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ ، وَأَنَّ اللَّهَ قَدْ أَحَاطَ بِكُلِّ شَيْءٍ عِلْمًا , اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ شَرِّ نَفْسِي ، وَمِنْ شَرِّ كُلِّ دَابَّةٍ أَنْتَ آخِذٌ بِنَاصِيَتِهَا ، إِنَّ رَبِّي عَلَى صِرَاطٍ مُسْتَقِيمٍ.  """,
        count: 1,
        contentTransliteration:
            "Allahumma anta rabbi la ilaha illa ant, 'alayka tawakkaltu wa anta rabbul-'arshil-'azim. Ma sha'allahu kana, wa ma lam yasha' lam yakun, wa la hawla wa la quwwata illa billahil-'aliyyil-'azim. A'lamu annallaha 'ala kulli shay'in qadir, wa annallaha qad ahata bikulli shay'in 'ilma. Allahumma inni a'udhu bika min sharri nafsi, wa min sharri kulli dabbatin anta akhidhun binasiyatiha, inna rabbi 'ala siratin mustaqim.",
        contentEn:
            "O Allah, You are my Lord, none has the right to be worshipped except You, upon You I rely and You are Lord of the mighty Throne. Whatever Allah wills happens and whatever He does not will does not happen. There is no might nor power except with Allah, the Most High, the Most Great. I know that Allah is over all things competent, and that Allah has encompassed all things in knowledge. O Allah, I take refuge in You from the evil of myself and from the evil of every creature whose forelock You hold. Indeed my Lord is on a straight path."),
    const ZikrEntity(
        id: 29,
        key: 'morning_029',
        category: 'morning',
        content:
            """لَا إلَه إلّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءِ قَدِيرِ. """,
        count: 100,
        contentTransliteration:
            "La ilaha illa Allah wahdahu la sharika lah, lahul mulku wa lahul hamdu wa huwa ala kulli shay'in qadir.",
        contentEn:
            "There is no god but Allah, alone, without partner; His is the dominion and His is the praise, and He is over all things competent."),
    const ZikrEntity(
        id: 30,
        key: 'morning_030',
        category: 'morning',
        content: """سُبْحـانَ اللهِ وَبِحَمْـدِهِ. """,
        count: 100,
        contentTransliteration: "Subhan Allahi wa bihamdih.",
        contentEn: "Glory be to Allah and praise Him."),
    const ZikrEntity(
        id: 31,
        key: 'morning_031',
        category: 'morning',
        content: """أسْتَغْفِرُ اللهَ وَأتُوبُ إلَيْهِ""",
        count: 100,
        contentTransliteration: "Astaghfirullaha wa atubu ilayh.",
        contentEn: "I seek the forgiveness of Allah and repent unto Him."),
  ];

  static List<ZikrEntity> nightAzkar = [
    const ZikrEntity(
        id: 1,
        key: 'evening_001',
        category: 'evening',
        title: 'آية الكرسى',
        content: """
أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ  بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيم {اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ} [آية الكرسى - البقرة 255]. """,
        count: 1,
        description: null,
        source: 'آية الكرسى',
        contentTransliteration:
            "Allāhu lā ilāha illā huwa, al-ḥayyu al-qayyūm. Lā ta'khudhuhu sinatun wa lā nawm. Lahu mā fis-samāwāti wa mā fil-arḍ. Man dhal-ladhī yashfa'u 'indahu illā bi-idhnih. Ya'lamu mā bayna aydīhim wa mā khalfahum, wa lā yuḥīṭūna bishay'im min 'ilmihi illā bimā shā'. Wasi'a kursiyyuhus-samāwāti wal-arḍ, wa lā ya'ūduhu ḥifẓuhumā, wa huwal-'aliyyul-'aẓīm.",
        contentEn:
            "Allah - there is no deity except Him, the Ever-Living, the Sustainer of existence. Neither drowsiness overtakes Him nor sleep. To Him belongs whatever is in the heavens and whatever is on the earth. Who is it that can intercede with Him except by His permission? He knows what is before them and what will be after them, and they encompass not a thing of His knowledge except for what He wills. His Kursi extends over the heavens and the earth, and their preservation tires Him not. And He is the Most High, the Most Great."),
    const ZikrEntity(
        id: 2,
        key: 'evening_002',
        category: 'evening',
        title: 'آخر سورة البقرة',
        content: """أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ
{آمَنَ الرَّسُولُ بِمَا أُنْزِلَ إِلَيْهِ مِنْ رَبِّهِ وَالْمُؤْمِنُونَ ۚ كُلٌّ آمَنَ بِاللَّهِ وَمَلَائِكَتِهِ وَكُتُبِهِ وَرُسُلِهِ لَا نُفَرِّقُ بَيْنَ أَحَدٍ مِنْ رُسُلِهِ ۚ وَقَالُوا سَمِعْنَا وَأَطَعْنَا ۖ غُفْرَانَكَ رَبَّنَا وَإِلَيْكَ الْمَصِيرُ. لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا لَهَا مَا كَسَبَتْ وَعَلَيْهَا مَا اكْتَسَبَتْ رَبَّنَا لَا تُؤَاخِذْنَا إِنْ نَّسِينَآ أَوْ أَخْطَأْنَا رَبَّنَا وَلَا تَحْمِلْ عَلَيْنَا إِصْرًا كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِنْ قَبْلِنَا رَبَّنَا وَلَا تُحَمِّلْنَا مَا لَا طَاقَةَ لَنَا بِهِ وَاعْفُ عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَا أَنْتَ مَوْلَانَا فَانْصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ.} [البقرة 285 - 286].""",
        count: 1,
        contentTransliteration:
            "A'udhu billahi minash-shaytanir-rajim. Amanar-rasulu bima unzila ilayhi mir-rabbihi wal-mu'minun, kullun amana billahi wa mala'ikatihi wa kutubihi wa rusulih, la nufarriqu bayna ahadim-mir-rusulih, wa qalu sami'na wa ata'na ghufranaka rabbana wa ilaykal-masir. La yukallifullahu nafsan illa wus'aha, laha ma kasabat wa 'alayha mak-tasabat, rabbana la tu'akhidhna in nasina aw akhta'na, rabbana wa la tahmil 'alayna isran kama hamaltahu 'alal-ladhina min qablina, rabbana wa la tuhammilna ma la taqata lana bih, wa'fu 'anna waghfir lana warhamna anta mawlana fansurna 'alal-qawmil-kafirin.",
        contentEn:
            "I seek refuge in Allah from the accursed Satan. The Messenger has believed in what was revealed to him from his Lord, and [so have] the believers. All of them have believed in Allah and His angels and His books and His messengers, [saying], 'We make no distinction between any of His messengers.' And they say, 'We hear and we obey. [We seek] Your forgiveness, our Lord, and to You is the [final] destination.' Allah does not charge a soul except with that within its capacity. It will have [the consequence of] what [good] it has gained, and it will bear [the consequence of] what [evil] it has earned. 'Our Lord, do not impose blame upon us if we have forgotten or erred. Our Lord, and lay not upon us a burden like that which You laid upon those before us. Our Lord, and burden us not with that which we have no ability to bear. And pardon us; and forgive us; and have mercy upon us. You are our protector, so give us victory over the disbelieving people.'"),
    const ZikrEntity(
        id: 3,
        key: 'evening_003',
        category: 'evening',
        title: 'سورة الإخلاص',
        content: """بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
قُلْ هُوَ ٱللَّهُ أَحَدٌ، ٱللَّهُ ٱلصَّمَدُ، لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُن لَّهُۥ كُفُوًا أَحَدٌۢ.""",
        count: 3,
        contentTransliteration:
            "Qul huwa Allāhu aḥad, Allāhuṣ-ṣamad, lam yalid wa lam yūlad, wa lam yakun lahu kufuwan aḥad.",
        contentEn:
            "Say: He is Allah, the One. Allah, the Eternal Refuge. He neither begets nor is born, nor is there to Him any equivalent."),
    const ZikrEntity(
        id: 4,
        key: 'evening_004',
        category: 'evening',
        title: 'سورة الفلق',
        content: """بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
قُلْ أَعُوذُ بِرَبِّ ٱلْفَلَقِ، مِن شَرِّ مَا خَلَقَ، وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ، وَمِن شَرِّ ٱلنَّفَّٰثَٰتِ فِى ٱلْعُقَدِ، وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ.""",
        count: 3,
        contentTransliteration:
            "Qul a'ūdhu birabbil-falaq, min sharri mā khalaq, wa min sharri ghāsiqin idhā waqab, wa min sharrin-naffāthāti fil-'uqad, wa min sharri ḥāsidin idhā ḥasad.",
        contentEn:
            "Say: I seek refuge in the Lord of daybreak, from the evil of that which He created, and from the evil of darkness when it settles, and from the evil of the blowers in knots, and from the evil of an envier when he envies."),
    const ZikrEntity(
        id: 5,
        key: 'evening_005',
        category: 'evening',
        title: 'سورة الناس',
        content: """بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ، مَلِكِ ٱلنَّاسِ، إِلَٰهِ ٱلنَّاسِ، مِن شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ، ٱلَّذِى يُوَسْوِسُ فِى صُدُورِ ٱلنَّاسِ، مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ.""",
        count: 3,
        contentTransliteration:
            "Qul a'ūdhu birabbin-nās, malikin-nās, ilāhin-nās, min sharril-waswāsil-khannās, alladhī yuwaswisu fī ṣudūrin-nās, minal-jinnati wan-nās.",
        contentEn:
            "Say: I seek refuge in the Lord of mankind, the Sovereign of mankind, the God of mankind, from the evil of the retreating whisperer who whispers [evil] into the breasts of mankind, from among the jinn and mankind."),
    const ZikrEntity(
        id: 6,
        key: 'evening_006',
        category: 'evening',
        content:
            """أَمْسَيْـنا وَأَمْسـى المـلكُ لله وَالحَمدُ لله ، لا إلهَ إلاّ اللّهُ وَحدَهُ لا شَريكَ لهُ، لهُ المُـلكُ ولهُ الحَمْـد، وهُوَ على كلّ شَيءٍ قدير ، رَبِّ أسْـأَلُـكَ خَـيرَ ما في هـذهِ اللَّـيْلَةِ وَخَـيرَ ما بَعْـدَهـا ، وَأَعـوذُ بِكَ مِنْ شَـرِّ ما في هـذهِ اللَّـيْلةِ وَشَرِّ ما بَعْـدَهـا ، رَبِّ أَعـوذُبِكَ مِنَ الْكَسَـلِ وَسـوءِ الْكِـبَر ، رَبِّ أَعـوذُ بِكَ مِنْ عَـذابٍ في النّـارِ وَعَـذابٍ في القَـبْر. """,
        count: 1,
        contentTransliteration:
            "Amsayna wa amsal-mulku lillah, wal-hamdu lillah, la ilaha illallahu wahdahu la sharika lah, lahul-mulku wa lahul-hamdu wa huwa 'ala kulli shay'in qadir. Rabbi as'aluka khayra ma fi hadhihil-laylati wa khayra ma ba'daha, wa a'udhu bika min sharri ma fi hadhihil-laylati wa sharri ma ba'daha. Rabbi a'udhu bika minal-kasali wa su'il-kibar. Rabbi a'udhu bika min 'adhabin fin-nari wa 'adhabin fil-qabr.",
        contentEn:
            "We have reached the evening and at this very time all sovereignty belongs to Allah, and all praise is for Allah. None has the right to be worshipped except Allah, alone, without partner, to Him belongs all sovereignty and praise and He is over all things omnipotent. My Lord, I ask You for the good of this night and the good of what follows it and I take refuge in You from the evil of this night and the evil of what follows it. My Lord, I take refuge in You from laziness and senility. My Lord, I take refuge in You from torment in the Fire and punishment in the grave."),
    const ZikrEntity(
        id: 7,
        key: 'evening_007',
        category: 'evening',
        title: 'سيد الاستغفار',
        titleEn: "The Master of Seeking Forgiveness",
        content:
            """اللّهـمَّ أَنْتَ رَبِّـي لا إلهَ إلاّ أَنْتَ ، خَلَقْتَنـي وَأَنا عَبْـدُك ، وَأَنا عَلـى عَهْـدِكَ وَوَعْـدِكَ ما اسْتَـطَعْـت ، أَعـوذُبِكَ مِنْ شَـرِّ ما صَنَـعْت ، أَبـوءُ لَـكَ بِنِعْـمَتِـكَ عَلَـيَّ وَأَبـوءُ بِذَنْـبي فَاغْفـِرْ لي فَإِنَّـهُ لا يَغْـفِرُ الذُّنـوبَ إِلاّ أَنْتَ .  """,
        count: 1,
        contentTransliteration:
            "Allahumma anta rabbi la ilaha illa ant, khalaqtani wa ana 'abduk, wa ana 'ala 'ahdika wa wa'dika mastata't, a'udhu bika min sharri ma sana't, abu'u laka bini'matika 'alayya wa abu'u bidhanbi faghfir li fa'innahu la yaghfirudh-dhunuba illa ant.",
        contentEn:
            "O Allah, You are my Lord, none has the right to be worshipped except You. You created me and I am Your servant, and I abide by Your covenant and promise as best I can. I take refuge in You from the evil of what I have done. I acknowledge Your favor upon me, and I acknowledge my sin, so forgive me, for none forgives sins except You."),
    const ZikrEntity(
        id: 8,
        key: 'evening_008',
        category: 'evening',
        content:
            """رَضيـتُ بِاللهِ رَبَّـاً وَبِالإسْلامِ ديـناً وَبِمُحَـمَّدٍ صلى الله عليه وسلم نَبِيّـاً.""",
        count: 3,
        contentTransliteration:
            "Radhitu billahi rabban, wa bil-Islami dinan, wa bi-Muhammadin sallallahu 'alayhi wa sallama nabiyya.",
        contentEn:
            "I am pleased with Allah as my Lord, with Islam as my religion and with Muhammad ﷺ as my Prophet."),
    const ZikrEntity(
        id: 9,
        key: 'evening_009',
        category: 'evening',
        content:
            """اللّهُـمَّ إِنِّـي أَمسيتُ أُشْـهِدُك ، وَأُشْـهِدُ حَمَلَـةَ عَـرْشِـك ، وَمَلَائِكَتَكَ ، وَجَمـيعَ خَلْـقِك ، أَنَّـكَ أَنْـتَ اللهُ لا إلهَ إلاّ أَنْـتَ وَحْـدَكَ لا شَريكَ لَـك ، وَأَنَّ مُحَمّـداً عَبْـدُكَ وَرَسـولُـك. """,
        count: 4,
        contentTransliteration:
            "Allahumma inni amsaytu ush-hiduka, wa ush-hidu hamalata 'arshik, wa mala'ikataka, wa jami'a khalqik, annaka antallahu la ilaha illa anta wahdaka la sharika lak, wa anna Muhammadan 'abduka wa rasuluk.",
        contentEn:
            "O Allah, I have reached the evening and call upon You, the bearers of Your Throne, Your angels and all creation to witness that You are Allah, none has the right to be worshipped except You alone, without partner, and that Muhammad is Your servant and Messenger."),
    const ZikrEntity(
        id: 10,
        key: 'evening_010',
        category: 'evening',
        content:
            """اللّهُـمَّ ما أَمسى بي مِـنْ نِعْـمَةٍ أَو بِأَحَـدٍ مِـنْ خَلْـقِك ، فَمِـنْكَ وَحْـدَكَ لا شريكَ لَـك ، فَلَـكَ الْحَمْـدُ وَلَـكَ الشُّكْـر. """,
        count: 1,
        contentTransliteration:
            "Allahumma ma amsa bi min ni'matin aw bi-ahadin min khalqik, faminka wahdaka la sharika lak, falakal-hamdu wa lakash-shukr.",
        contentEn:
            "O Allah, whatever blessing has come to me or any of Your creation this evening is from You alone, without partner, so for You is all praise and unto You all thanks."),
    const ZikrEntity(
        id: 11,
        key: 'evening_011',
        category: 'evening',
        content:
            """حَسْبِـيَ اللّهُ لا إلهَ إلاّ هُوَ عَلَـيهِ تَوَكَّـلتُ وَهُوَ رَبُّ العَرْشِ العَظـيم.  """,
        count: 7,
        contentTransliteration:
            "Hasbiyallahu la ilaha illa huwa, 'alayhi tawakkaltu wa huwa rabbul-'arshil-'azim.",
        contentEn:
            "Allah is sufficient for me, none has the right to be worshipped except Him, upon Him I rely, and He is Lord of the mighty Throne."),
    const ZikrEntity(
        id: 12,
        key: 'evening_012',
        category: 'evening',
        content:
            """بِسـمِ اللهِ الذي لا يَضُـرُّ مَعَ اسمِـهِ شَيءٌ في الأرْضِ وَلا في السّمـاءِ وَهـوَ السّمـيعُ العَلـيم. """,
        count: 3,
        description: "لم يضره من الله شيء.",
        descriptionEn: "Nothing will harm him.",
        contentTransliteration:
            "Bismillahilladhi la yadhurru ma'as-mihi shay'un fil-ardi wa la fis-sama'i wa huwas-sami'ul-'alim.",
        contentEn:
            "In the name of Allah, with whose name nothing on earth or in heaven can cause harm, and He is the All-Hearing, the All-Knowing."),
    const ZikrEntity(
        id: 13,
        key: 'evening_013',
        category: 'evening',
        content:
            """اللّهُـمَّ بِكَ أَمْسَـينا وَبِكَ أَصْـبَحْنا، وَبِكَ نَحْـيا وَبِكَ نَمُـوتُ وَإِلَـيْكَ الْمَصِيرُ. """,
        count: 1,
        contentTransliteration:
            "Allahumma bika amsayna, wa bika asbahna, wa bika nahya, wa bika namutu wa ilaykal-masir.",
        contentEn:
            "O Allah, by You we enter the evening and by You we enter the morning, by You we live and by You we die, and unto You is the return."),
    const ZikrEntity(
        id: 14,
        key: 'evening_014',
        category: 'evening',
        content:
            """أَمْسَيْنَا عَلَى فِطْرَةِ الإسْلاَمِ، وَعَلَى كَلِمَةِ الإِخْلاَصِ، وَعَلَى دِينِ نَبِيِّنَا مُحَمَّدٍ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ، وَعَلَى مِلَّةِ أَبِينَا إبْرَاهِيمَ حَنِيفاً مُسْلِماً وَمَا كَانَ مِنَ المُشْرِكِينَ.  """,
        count: 1,
        contentTransliteration:
            "Amsayna 'ala fitratil-Islam, wa 'ala kalimatil-ikhlas, wa 'ala dini nabiyyina Muhammadin sallallahu 'alayhi wa sallam, wa 'ala millati abina Ibrahima hanifan musliman wa ma kana minal-mushrikin.",
        contentEn:
            "We have entered the evening upon the natural religion of Islam, the word of sincere devotion, the religion of our Prophet Muhammad ﷺ, and the way of our father Abraham, who was upright in submission and was not of those who associate partners with Allah."),
    const ZikrEntity(
        id: 15,
        key: 'evening_015',
        category: 'evening',
        content:
            """سُبْحـانَ اللهِ وَبِحَمْـدِهِ عَدَدَ خَلْـقِه ، وَرِضـا نَفْسِـه ، وَزِنَـةَ عَـرْشِـه ، وَمِـدادَ كَلِمـاتِـه. """,
        count: 3,
        contentTransliteration:
            "Subhanallahi wa bihamdihi, 'adada khalqihi, wa ridha nafsihi, wa zinata 'arshihi, wa midada kalimatih.",
        contentEn:
            "Glory is to Allah and praise is to Him, by the number of His creation, in accordance with His pleasure, by the weight of His Throne, and equal to the ink of His words."),
    const ZikrEntity(
        id: 16,
        key: 'evening_016',
        category: 'evening',
        content:
            """اللّهُـمَّ عافِـني في بَدَنـي ، اللّهُـمَّ عافِـني في سَمْـعي ، اللّهُـمَّ عافِـني في بَصَـري ، لا إلهَ إلاّ أَنْـتَ. """,
        count: 3,
        contentTransliteration:
            "Allahumma 'afini fi badani, Allahumma 'afini fi sam'i, Allahumma 'afini fi basari, la ilaha illa ant.",
        contentEn:
            "O Allah, grant my body health. O Allah, grant my hearing health. O Allah, grant my sight health. None has the right to be worshipped except You."),
    const ZikrEntity(
        id: 17,
        key: 'evening_017',
        category: 'evening',
        content:
            """اللّهُـمَّ إِنّـي أَعـوذُ بِكَ مِنَ الْكُـفر ، وَالفَـقْر ، وَأَعـوذُ بِكَ مِنْ عَذابِ القَـبْر ، لا إلهَ إلاّ أَنْـتَ. """,
        count: 3,
        contentTransliteration:
            "Allahumma inni a'udhu bika minal-kufri, wal-faqri, wa a'udhu bika min 'adhabil-qabri, la ilaha illa ant.",
        contentEn:
            "O Allah, I take refuge in You from disbelief and poverty, and I take refuge in You from the punishment of the grave. None has the right to be worshipped except You."),
    const ZikrEntity(
        id: 18,
        key: 'evening_018',
        category: 'evening',
        content:
            """اللّهُـمَّ إِنِّـي أسْـأَلُـكَ العَـفْوَ وَالعـافِـيةَ في الدُّنْـيا وَالآخِـرَة ، اللّهُـمَّ إِنِّـي أسْـأَلُـكَ العَـفْوَ وَالعـافِـيةَ في ديني وَدُنْـيايَ وَأهْـلي وَمالـي ، اللّهُـمَّ اسْتُـرْ عـوْراتي وَآمِـنْ رَوْعاتـي ، اللّهُـمَّ احْفَظْـني مِن بَـينِ يَدَيَّ وَمِن خَلْفـي وَعَن يَمـيني وَعَن شِمـالي ، وَمِن فَوْقـي ، وَأَعـوذُ بِعَظَمَـتِكَ أَن أُغْـتالَ مِن تَحْتـي. """,
        count: 1,
        contentTransliteration:
            "Allahumma inni as'alukal-'afwa wal-'afiyata fid-dunya wal-akhirah, Allahumma inni as'alukal-'afwa wal-'afiyata fi dini wa dunyaya wa ahli wa mali, Allahummastur 'awrati wa amin raw'ati, Allahummahfazni min bayni yadayya wa min khalfi wa 'an yamini wa 'an shimali wa min fawqi, wa a'udhu bi'azamatika an ughtala min tahti.",
        contentEn:
            "O Allah, I ask You for pardon and well-being in this life and the next. O Allah, I ask You for pardon and well-being in my religious and worldly affairs, and my family and my wealth. O Allah, veil my faults and calm my fears. O Allah, guard me from before me and behind me, from my right and my left, and from above me, and I take refuge in Your greatness from being taken unaware from beneath me."),
    const ZikrEntity(
        id: 19,
        key: 'evening_019',
        category: 'evening',
        content: """
يَا حَيُّ يَا قيُّومُ بِرَحْمَتِكَ أسْتَغِيثُ أصْلِحْ لِي شَأنِي كُلَّهُ وَلاَ تَكِلْنِي إلَى نَفْسِي طَـرْفَةَ عَيْنٍ.
""",
        count: 3,
        contentTransliteration:
            "Ya hayyu ya qayyumu birahmatika astaghith, aslih li sha'ni kullah, wa la takilni ila nafsi tarfata 'ayn.",
        contentEn:
            "O Ever-Living, O Self-Subsisting and Supporter of all, by Your mercy I seek relief. Rectify all my affairs and do not leave me to myself, even for the blink of an eye."),
    const ZikrEntity(
        id: 20,
        key: 'evening_020',
        category: 'evening',
        content:
            """أَمْسَيْنا وَأَمْسَى الْمُلْكُ للهِ رَبِّ الْعَالَمَيْنِ، اللَّهُمَّ إِنَّي أسْأَلُكَ خَيْرَ هَذَه اللَّيْلَةِ فَتْحَهَا ونَصْرَهَا، ونُوْرَهَا وبَرَكَتهَا، وَهُدَاهَا، وَأَعُوذُ بِكَ مِنْ شَرِّ مَا فيهِا وَشَرَّ مَا بَعْدَهَا. """,
        count: 1,
        contentTransliteration:
            "Amsayna wa amsal-mulku lillahi rabbil-'alamin. Allahumma inni as'aluka khayra hadhihil-laylah: fathaha wa nasraha wa nuraha wa barakataha wa hudaha, wa a'udhu bika min sharri ma fiha wa sharri ma ba'daha.",
        contentEn:
            "We have reached the evening and at this very time all sovereignty belongs to Allah, Lord of the worlds. O Allah, I ask You for the good of this night: its triumph, its help, its light, its blessings, and its guidance, and I take refuge in You from the evil in it and the evil that follows it."),
    const ZikrEntity(
        id: 21,
        key: 'evening_021',
        category: 'evening',
        content:
            """اللّهُـمَّ عالِـمَ الغَـيْبِ وَالشّـهادَةِ فاطِـرَ السّماواتِ وَالأرْضِ رَبَّ كـلِّ شَـيءٍ وَمَليـكَه ، أَشْهَـدُ أَنْ لا إِلـهَ إِلاّ أَنْت ، أَعـوذُ بِكَ مِن شَـرِّ نَفْسـي وَمِن شَـرِّ الشَّيْـطانِ وَشِرْكِهِ ، وَأَنْ أَقْتَـرِفَ عَلـى نَفْسـي سوءاً أَوْ أَجُـرَّهُ إِلـى مُسْـلِم. """,
        count: 1,
        contentTransliteration:
            "Allahumma 'alimal-ghaybi wash-shahadati fatiras-samawati wal-ard, rabba kulli shay'in wa malikah, ash-hadu an la ilaha illa ant, a'udhu bika min sharri nafsi wa min sharrish-shaytani wa shirkih, wa an aqtarifa 'ala nafsi su'an aw ajurrahu ila muslim.",
        contentEn:
            "O Allah, Knower of the unseen and the seen, Creator of the heavens and the earth, Lord and Sovereign of all things, I bear witness that none has the right to be worshipped except You. I take refuge in You from the evil of my soul and from the evil and shirk of Satan, and from committing wrong against myself or bringing such upon another Muslim."),
    const ZikrEntity(
        id: 22,
        key: 'evening_022',
        category: 'evening',
        content:
            """أَعـوذُ بِكَلِمـاتِ اللّهِ التّـامّـاتِ مِنْ شَـرِّ ما خَلَـق. """,
        count: 3,
        contentTransliteration:
            "A'udhu bikalimatillahit-tammati min sharri ma khalaq.",
        contentEn:
            "I take refuge in the perfect words of Allah from the evil of what He has created."),
    const ZikrEntity(
        id: 23,
        key: 'evening_023',
        category: 'evening',
        content:
            """اللَّهُمَّ صَلِّ وَسَلِّمْ وَبَارِكْ على نَبِيِّنَا مُحمَّد. """,
        count: 10,
        contentTransliteration:
            "Allahumma salli wa sallim wa barik 'ala nabiyyina Muhammad.",
        contentEn:
            "O Allah, send prayers, peace, and blessings upon our Prophet Muhammad."),
    const ZikrEntity(
        id: 24,
        key: 'evening_024',
        category: 'evening',
        content:
            """اللَّهُمَّ إِنَّا نَعُوذُ بِكَ مِنْ أَنْ نُشْرِكَ بِكَ شَيْئًا نَعْلَمُهُ ، وَنَسْتَغْفِرُكَ لِمَا لَا نَعْلَمُهُ. """,
        count: 3,
        contentTransliteration:
            "Allahumma inna na'udhu bika an nushrika bika shay'an na'lamuh, wa nastaghfiruka lima la na'lamuh.",
        contentEn:
            "O Allah, we take refuge in You from associating anything with You knowingly, and we seek Your forgiveness for that which we do not know."),
    const ZikrEntity(
        id: 25,
        key: 'evening_025',
        category: 'evening',
        content:
            """اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ الْهَمِّ وَالْحَزَنِ، وَأَعُوذُ بِكَ مِنْ الْعَجْزِ وَالْكَسَلِ، وَأَعُوذُ بِكَ مِنْ الْجُبْنِ وَالْبُخْلِ، وَأَعُوذُ بِكَ مِنْ غَلَبَةِ الدَّيْنِ، وَقَهْرِ الرِّجَالِ. """,
        count: 3,
        contentTransliteration:
            "Allahumma inni a'udhu bika minal-hammi wal-hazan, wal-'ajzi wal-kasal, wal-jubni wal-bukhl, wa ghalabatid-dayni wa qahrir-rijal.",
        contentEn:
            "O Allah, I take refuge in You from anxiety and sorrow, weakness and laziness, cowardice and miserliness, the burden of debts and being overpowered by men."),
    const ZikrEntity(
        id: 26,
        key: 'evening_026',
        category: 'evening',
        content:
            """أسْتَغْفِرُ اللهَ العَظِيمَ الَّذِي لاَ إلَهَ إلاَّ هُوَ، الحَيُّ القَيُّومُ، وَأتُوبُ إلَيهِ. """,
        count: 3,
        contentTransliteration:
            "Astaghfirullahal-'azimalladhi la ilaha illa huwal-hayyul-qayyumu wa atubu ilayh.",
        contentEn:
            "I seek the forgiveness of Allah, the Mighty, whom there is none worthy of worship except Him, the Ever-Living, the Self-Subsisting, and I repent unto Him."),
    const ZikrEntity(
        id: 27,
        key: 'evening_027',
        category: 'evening',
        content:
            """يَا رَبِّ , لَكَ الْحَمْدُ كَمَا يَنْبَغِي لِجَلَالِ وَجْهِكَ , وَلِعَظِيمِ سُلْطَانِكَ. """,
        count: 3,
        contentTransliteration:
            "Ya rabbi, lakal-hamdu kama yanbaghi lijalali wajhika wa 'azimi sultanik.",
        contentEn:
            "O my Lord, praise be to You as befits the majesty of Your Face and the greatness of Your power."),
    const ZikrEntity(
        id: 28,
        key: 'evening_028',
        category: 'evening',
        content:
            """لَا إلَه إلّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءِ قَدِيرِ. """,
        count: 100,
        contentTransliteration:
            "La ilaha illa Allah wahdahu la sharika lah, lahul mulku wa lahul hamdu wa huwa ala kulli shay'in qadir.",
        contentEn:
            "There is no god but Allah, alone, without partner; His is the dominion and His is the praise, and He is over all things competent."),
    const ZikrEntity(
        id: 29,
        key: 'evening_029',
        category: 'evening',
        content:
            """اللَّهُمَّ أَنْتَ رَبِّي لا إِلَهَ إِلا أَنْتَ ، عَلَيْكَ تَوَكَّلْتُ ، وَأَنْتَ رَبُّ الْعَرْشِ الْعَظِيمِ , مَا شَاءَ اللَّهُ كَانَ ، وَمَا لَمْ يَشَأْ لَمْ يَكُنْ ، وَلا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ الْعَلِيِّ الْعَظِيمِ , أَعْلَمُ أَنَّ اللَّهَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ ، وَأَنَّ اللَّهَ قَدْ أَحَاطَ بِكُلِّ شَيْءٍ عِلْمًا , اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ شَرِّ نَفْسِي ، وَمِنْ شَرِّ كُلِّ دَابَّةٍ أَنْتَ آخِذٌ بِنَاصِيَتِهَا ، إِنَّ رَبِّي عَلَى صِرَاطٍ مُسْتَقِيمٍ. """,
        count: 1,
        contentTransliteration:
            "Allahumma anta rabbi la ilaha illa ant, 'alayka tawakkaltu wa anta rabbul-'arshil-'azim. Ma sha'allahu kana, wa ma lam yasha' lam yakun, wa la hawla wa la quwwata illa billahil-'aliyyil-'azim. A'lamu annallaha 'ala kulli shay'in qadir, wa annallaha qad ahata bikulli shay'in 'ilma. Allahumma inni a'udhu bika min sharri nafsi, wa min sharri kulli dabbatin anta akhidhun binasiyatiha, inna rabbi 'ala siratin mustaqim.",
        contentEn:
            "O Allah, You are my Lord, none has the right to be worshipped except You, upon You I rely and You are Lord of the mighty Throne. Whatever Allah wills happens and whatever He does not will does not happen. There is no might nor power except with Allah, the Most High, the Most Great. I know that Allah is over all things competent, and that Allah has encompassed all things in knowledge. O Allah, I take refuge in You from the evil of myself and from the evil of every creature whose forelock You hold. Indeed my Lord is on a straight path."),
    const ZikrEntity(
        id: 30,
        key: 'evening_030',
        category: 'evening',
        content: """سُبْحـانَ اللهِ وَبِحَمْـدِهِ. """,
        count: 100,
        contentTransliteration: "Subhan Allahi wa bihamdih.",
        contentEn: "Glory be to Allah and praise Him."),
  ];

  static List<ZikrEntity> conditionAzkar = [
    const ZikrEntity(
        id: 1,
        key: 'condition_001',
        category: 'newClothes',
        titleEn: "New Clothes",
        count: 1,
        title: "لبس ثوب جديد",
        content:
            "اللَّهُمَّ لَكَ الحَمْدُ أَنْتَ كَسَوْتَنِيْهِ أَسْأَلُكَ مِنْ خَيْرِهِ، وَخَيْرِ مَا صُنِعَ لَهُ، وَأَعُوذُ بِكَ مِنْ شَرِّهِ، وَشَرِّ مَا صُنِعَ لَهُ",
        contentTransliteration:
            "Allahumma lakal-hamd, anta kasawtanihi, as'aluka min khayrihi wa khayri ma suni'a lah, wa a'udhu bika min sharrihi wa sharri ma suni'a lah.",
        contentEn:
            "O Allah, praise is to You. You have clothed me with it. I ask You for its goodness and the goodness of what it was made for, and I take refuge in You from its evil and the evil of what it was made for.",
        description:
            "عن أبي سعيد الخدري رضي الله عنه قال: كَانَ رَسُولُ الله- صلى الله عليه وسلم- إذَا اسْتَجَدَّ ثَوباً سَمَّاه بِاسْمِهِ: إمَّا قَمِيصاً أَوْ عِمَامَةً ثُمَّ يَقُولُ: «اللَّهُمَّ لَكَ الحَمْدُ أَنْتَ كَسَوْتَنِيْهِ أَسْأَلُكَ مِنْ خَيْرِهِ، وَخَيْرِ مَا صُنِعَ لَهُ، وَأَعُوذُ بِكَ مِنْ شَرِّهِ، وَشَرِّ مَا صُنِعَ لَهُ». قَالَ أَبُو نَضْرَةَ: فَكَانَ أَصْحَابُ النَّبِيِّ- صلى الله عليه وسلم- إذَا لَبِسَ أَحَدُهُمْ ثَوباً جَدِيداً قِيلَ لَهُ: تُبْلِي وَيُخْلِفُ الله تَعَالَى. أخرجه أبو داود والترمذي",
        descriptionEn:
            "Abu Sa'id al-Khudri (may Allah be pleased with him) reported that whenever the Messenger of Allah ﷺ wore a new garment, he would name it (a shirt, turban, or otherwise) and say the above. Abu Nadrah said: The Companions of the Prophet ﷺ, when one of them wore a new garment, would say to him: \"May you wear it out and may Allah give you another in its place.\" Reported by Abu Dawud and at-Tirmidhi.",
        sourceEn: "Abu Dawud and at-Tirmidhi"),
    const ZikrEntity(
        id: 2,
        key: 'condition_002',
        category: 'leavingHome',
        titleEn: "Leaving Home",
        count: 1,
        title: "الخروج من البيت",
        content:
            "بسم الله تَوكّلت عَلى الله اللَّهُمَّ إنّا نعُوذُ بِكَ من أَنْ نزِلَّ أَوْ نضِلَّ، أَوْ نظْلِمَ أَوْ نُظْلَمَ، أَوْ نجْهَلَ أَوْ يُجْهَلَ عَلَينا",
        contentTransliteration:
            "Bismillahi, tawakkaltu 'alallah, Allahumma inna na'udhu bika an nazilla aw nadilla, aw nazlima aw nuzlama, aw najhala aw yujhala 'alayna.",
        contentEn:
            "In the name of Allah, I place my trust in Allah. O Allah, we take refuge in You lest we stray or be led astray, lest we slip or be caused to slip, lest we oppress or be oppressed, lest we behave foolishly or be treated foolishly.",
        description: """
عن أم سلمة رضي الله عنها أن النَّبِيَّ- صلى الله عليه وسلم- كان إذا خَرج مِنْ بَيْتِه قَالَ: «بسم الله تَوكّلت عَلى الله اللَّهُمَّ إنّا نعُوذُ بِكَ من أَنْ نزِلَّ أَوْ نضِلَّ، أَوْ نظْلِمَ أَوْ نُظْلَمَ، أَوْ نجْهَلَ أَوْ يُجْهَلَ عَلَينا». أخرجه الترمذي والنسائي.
 وعن أنس بن مالك رضي الله عنه أن النبي- صلى الله عليه وسلم- قال: «إذَا خَرَجَ الرَّجُلُ مِنْ بَيْتِهِ فَقَالَ: بِاسْمِ الله، تَوَكَّلْتُ عَلَى الله، لا حَوْلَ وَلا قُوَّةَ إلَّا بِاللهِ» قَالَ: «يُقَالُ حِينَئِذٍ هُدِيتَ وَكُفِيتَ وَوُقِيتَ فَتَتَنَحَّى لَهُ الشَّيَاطِينُ، فَيَقُولُ لَهُ شَيْطَانٌ آخَرُ: كَيفَ لَكَ بِرَجُلٍ قَدْ هُدِيَ وَكُفِيَ وَوُقِيَ». أخرجه أبو داود والترمذي
""",
        descriptionEn:
            "Umm Salamah (may Allah be pleased with her) reported that whenever the Prophet ﷺ left his house he would say the above. Reported by at-Tirmidhi and an-Nasa'i. And Anas ibn Malik (may Allah be pleased with him) reported that the Prophet ﷺ said: \"When a man leaves his house and says: 'In the name of Allah, I place my trust in Allah, there is no might nor power except with Allah,' it is said to him: You are guided, sufficed, and protected, and the devils turn away from him.\" Reported by Abu Dawud and at-Tirmidhi."),
    const ZikrEntity(
        id: 3,
        key: 'condition_003',
        category: 'enteringBathroom',
        titleEn: "Entering the Bathroom",
        count: 1,
        title: "دخول دورة المياة",
        content: "اللَّهُمَّ إنِّي أَعُوذُ بِكَ مِنَ الخُبْثِ وَالخَبَائِثِ",
        contentTransliteration:
            "Allahumma inni a'udhu bika minal-khubthi wal-khaba'ith.",
        contentEn: "O Allah, I take refuge in You from male and female devils.",
        description: """
عن أنس رضي الله عنه قال: كان النبي- صلى الله عليه وسلم- إذا دخل الخلاء قال: «اللَّهُمَّ إنِّي أَعُوذُ بِكَ مِنَ الخُبْثِ وَالخَبَائِثِ». متفق عليه""",
        descriptionEn:
            "Anas (may Allah be pleased with him) reported that whenever the Prophet ﷺ entered the toilet, he would say the above. Agreed upon (Bukhari and Muslim)."),
    const ZikrEntity(
        id: 4,
        key: 'condition_004',
        category: 'leavingBathroom',
        titleEn: "Leaving the Bathroom",
        count: 1,
        title: "الخروج من دورة المياة",
        content: "غُفْرَانَكَ",
        contentTransliteration: "Ghufranak.",
        contentEn: "I ask You for forgiveness.",
        description: """
عن عائشة رضي الله عنها أَنَّ النَّبِيَّ- صلى الله عليه وسلم- كَانَ إذَا خَرَجَ مِنَ الغَائِطِ قَالَ: «غُفْرَانَكَ». أخرجه أبو داود والترمذي
""",
        descriptionEn:
            "A'ishah (may Allah be pleased with her) reported that whenever the Prophet ﷺ came out of the toilet he would say: \"I ask You for forgiveness.\" Reported by Abu Dawud and at-Tirmidhi."),
    const ZikrEntity(
        id: 5,
        key: 'condition_005',
        category: 'enteringMosque',
        titleEn: "Entering the Mosque",
        count: 1,
        title: "دخول المسجد",
        content: "اللَّهُمَّ افْتَحْ لِي أَبْوَابَ رَحْمَتِكَ",
        contentTransliteration: "Allahummaftah li abwaba rahmatik.",
        contentEn: "O Allah, open the doors of Your mercy for me.",
        description:
            """ إذا دخلَ أحدُكُمُ المسجِدَ ، فليسلِّم علَى النَّبيِّ صلَّى اللَّهُ عليهِ وسلَّمَ ، ثمَّ ليقُلْ : اللَّهمَّ افتَح لي أبوابَ رحمتِكَ ، وإذا خرجَ فليقُلْ : اللَّهمَّ إنِّي أسألُكَ مِن فضلِكَ. أخرجه ابن ماجه واللفظ له، وأخرجه مسلم باختلاف يسير""",
        descriptionEn:
            "When one of you enters the mosque, let him send prayers upon the Prophet ﷺ, then say: \"O Allah, open the doors of Your mercy for me,\" and when he leaves let him say: \"O Allah, I ask You of Your bounty.\" Reported by Ibn Majah (this wording) and Muslim with slight variation."),
    const ZikrEntity(
        id: 6,
        key: 'condition_006',
        category: 'leavingMosque',
        titleEn: "Leaving the Mosque",
        count: 1,
        title: "الخروج من المسجد",
        content: "اللَّهُمَّ إنِّي أسْأَلُكَ مِن فَضْلِكَ",
        contentTransliteration: "Allahumma inni as'aluka min fadlik.",
        contentEn: "O Allah, I ask You of Your bounty.",
        description: """
إذا دَخَلَ أحَدُكُمُ المَسْجِدَ، فَلْيَقُلِ: اللَّهُمَّ افْتَحْ لي أبْوابَ رَحْمَتِكَ، وإذا خَرَجَ، فَلْيَقُلِ: اللَّهُمَّ إنِّي أسْأَلُكَ مِن فَضْلِكَ.
الراوي : أبو حميد أو أبو أسيد الساعدي.حديث صحيح رواه مسلم
""",
        descriptionEn:
            "When one of you enters the mosque let him say: \"O Allah, open the doors of Your mercy for me,\" and when he leaves let him say: \"O Allah, I ask You of Your bounty.\" Narrated by Abu Humayd or Abu Usayd as-Sa'idi; authentic hadith reported by Muslim."),
    const ZikrEntity(
        id: 7,
        key: 'condition_007',
        category: 'hearingAdhan',
        titleEn: "Hearing the Adhan",
        count: 1,
        title: "1 سماع الأذان",
        content: "قل كما يقول المؤذن. ثم صل على النبي",
        contentEn:
            "Repeat what the caller to prayer says, then send prayers upon the Prophet.",
        description: """
عن عبد الله بن عمرو بن العاص رضي الله عنهما أنه سمع النبي- صلى الله عليه وسلم- يقول: «إذَا سَمِعْتُمُ المُؤَذِّنَ فَقُولُوا مِثْلَ مَا يَقُولُ، ثُمَّ صَلُّوا عَلَيَّ؛ فَإنَّهُ مَنْ صَلَّى عَلَيَّ صَلاةً صَلَّى الله عَلَيهِ بِهَا عَشْراً، ثُمَّ سَلُوا الله لِيَ الوَسِيلَةَ فَإنَّهَا مَنْزِلَةٌ فِي الجَنَّةِ لا تَنْبَغِي إلَّا لِعَبْدٍ مِنْ عِبَادِ الله، وَأَرْجُو أَنْ أَكُونَ أَنَا هُوَ، فَمَنْ سَأَلَ لِيَ الوَسِيلَةَ حَلَّتْ لَهُ الشَّفَاعَةُ». أخرجه مسلم.""",
        descriptionEn:
            "Abdullah ibn 'Amr ibn al-'As (may Allah be pleased with them both) reported that he heard the Prophet ﷺ say: \"When you hear the caller to prayer, say what he says, then send prayers upon me, for whoever sends one prayer upon me, Allah sends ten prayers upon him. Then ask Allah to grant me al-Wasilah, for it is a station in Paradise fitting for only one of Allah's servants, and I hope that I am he. Whoever asks Allah to grant me al-Wasilah, intercession becomes permissible for him.\" Reported by Muslim."),
    const ZikrEntity(
        id: 8,
        key: 'condition_008',
        category: 'hearingAdhan',
        titleEn: "Hearing the Adhan",
        count: 1,
        title: "2 سماع الأذان",
        content:
            "أَشْهَدُ أَنْ لا إلَهَ إلَّا الله وَحْدَهُ لا شَرِيكَ لَهُ، وَأَنَّ مُحَمَّداً عَبْدُهُ وَرَسُولُهُ، رَضِيتُ بِالله رَبّاً، وَبِمُحَمَّدٍ رَسُولاً، وَبِالإسْلامِ دِيناً",
        contentTransliteration:
            "Ash-hadu an la ilaha illallahu wahdahu la sharika lah, wa anna Muhammadan 'abduhu wa rasuluh, radhitu billahi rabban, wa bi-Muhammadin rasulan, wa bil-Islami dina.",
        contentEn:
            "I bear witness that none has the right to be worshipped except Allah alone, without partner, and that Muhammad is His servant and Messenger. I am pleased with Allah as my Lord, with Muhammad as my Messenger, and with Islam as my religion.",
        description: """
عن سعد بن أبي وقاص رضي الله عنه عن رسول الله- صلى الله عليه وسلم- أَنَّهُ قَالَ: «مَنْ قَالَ حِينَ يَسْمَعُ المُؤَذِّنَ: أَشْهَدُ أَنْ لا إلَهَ إلَّا الله وَحْدَهُ لا شَرِيكَ لَهُ، وَأَنَّ مُحَمَّداً عَبْدُهُ وَرَسُولُهُ، رَضِيتُ بِالله رَبّاً، وَبِمُحَمَّدٍ رَسُولاً، وَبِالإسْلامِ دِيناً، غُفِرَ لَهُ ذَنْبُهُ». أخرجه مسلم
""",
        descriptionEn:
            "Sa'd ibn Abi Waqqas (may Allah be pleased with him) reported that the Messenger of Allah ﷺ said: \"Whoever says upon hearing the caller to prayer: [the above], his sins will be forgiven.\" Reported by Muslim."),
    const ZikrEntity(
        id: 9,
        key: 'condition_009',
        category: 'afterAdhan',
        titleEn: "After the Adhan",
        count: 1,
        title: "بعد سماع الأذان",
        content:
            "اللَّهُمَّ رَبَّ هَذِهِ الدَّعْوَةِ التَّامَّةِ، وَالصَّلاةِ القَائِمَةِ، آتِ مُحَمَّداً الوَسِيلَةَ وَالفَضِيلَةَ، وَابْعَثْهُ مَقَاماً مَحْمُوداً الَّذِي وَعَدْتَهُ",
        contentTransliteration:
            "Allahumma rabba hadhihid-da'watit-tammah, was-salatil-qa'imah, ati Muhammadanil-wasilata wal-fadilah, wab'ath-hu maqaman mahmudanil-ladhi wa'adtah.",
        contentEn:
            "O Allah, Lord of this perfect call and of the prayer about to be offered, grant Muhammad the intercession and favor, and raise him to the honored station You have promised him.",
        description: """
عن جابر بن عبد الله رضي الله عنهما أن رسول الله- صلى الله عليه وسلم- قال: «مَنْ قَالَ حِينَ يَسْمَعُ النِّدَاءَ: اللَّهُمَّ رَبَّ هَذِهِ الدَّعْوَةِ التَّامَّةِ، وَالصَّلاةِ القَائِمَةِ، آتِ مُحَمَّداً الوَسِيلَةَ وَالفَضِيلَةَ، وَابْعَثْهُ مَقَاماً مَحْمُوداً الَّذِي وَعَدْتَهُ، حَلَّتْ لَهُ شَفَاعَتِي يَومَ القِيَامَةِ». أخرجه البخاري""",
        descriptionEn:
            "Jabir ibn Abdullah (may Allah be pleased with them both) reported that the Messenger of Allah ﷺ said: \"Whoever, upon hearing the call to prayer, says: [the above], my intercession will be permitted for him on the Day of Resurrection.\" Reported by al-Bukhari."),
    const ZikrEntity(
        id: 10,
        key: 'condition_010',
        category: 'distress',
        titleEn: "At Distress",
        count: 1,
        title: "عند الكرب",
        content:
            "لا إلَهَ إلَّا الله العَظِيمُ الحَلِيمُ، لا إلَهَ إلَّا الله رَبُّ العَرْشِ العَظِيمِ، لا إلَهَ إلَّا الله رَبُّ السَّماَوَاتِ، وَرَبُّ الأَرْضِ، وَرَبُّ العَرْشِ الكَريمِ",
        contentTransliteration:
            "La ilaha illallahul-'azimul-halim, la ilaha illallahu rabbul-'arshil-'azim, la ilaha illallahu rabbus-samawati wa rabbul-ard, wa rabbul-'arshil-karim.",
        contentEn:
            "There is no god but Allah, the Mighty, the Forbearing. There is no god but Allah, Lord of the mighty Throne. There is no god but Allah, Lord of the heavens, Lord of the earth, and Lord of the noble Throne.",
        description: """
عن ابن عباس رضي الله عنهما أَنَّ رَسُولَ الله- صلى الله عليه وسلم- كَانَ يَقُولُ عِنْدَ الكَرْبِ: «لا إلَهَ إلَّا الله العَظِيمُ الحَلِيمُ، لا إلَهَ إلَّا الله رَبُّ العَرْشِ العَظِيمِ، لا إلَهَ إلَّا الله رَبُّ السَّماَوَاتِ، وَرَبُّ الأَرْضِ، وَرَبُّ العَرْشِ الكَريمِ». متفق عليه""",
        descriptionEn:
            "Ibn Abbas (may Allah be pleased with them both) reported that the Messenger of Allah ﷺ used to say the above at times of distress. Agreed upon."),
    const ZikrEntity(
        id: 11,
        key: 'condition_011',
        category: 'sadness',
        titleEn: "Sadness or Grief",
        count: 1,
        title: "عند الهَمّ أو الحزن",
        content:
            "اللَّهُمَّ إنِّي عَبْدُكَ، وَابْنُ عَبْدِكَ، وَابْنُ أَمَتِكَ نَاصِيَتِي بِيَدِكَ، مَاضٍ فِيَّ حُكْمُكَ، عَدْلٌ فِيَّ قَضَاؤُكَ، أَسْأَلُكَ بِكُلِّ اسْمٍ هُوَ لَكَ سَمَّيْتَ بِهِ نَفْسَكَ، أَوْ عَلَّمْتَهُ أَحَداً مِن خَلْقِكَ، أَوْ أَنْزَلْتَهُ فِي كِتَابِكَ، أَوْ اسْتَأْثَرْتَ بِهِ فِي عِلْمِ الغَيْبِ عِنْدَكَ، أَنْ تَجْعَلَ القُرآنَ رَبِيعَ قَلْبِي، وَنُورَ صَدْرِي، وَجِلاءَ حُزْنِي وَذَهَابَ هَمِّي",
        contentTransliteration:
            "Allahumma inni 'abduka, wabnu 'abdika, wabnu amatik, nasiyati biyadik, madin fiyya hukmuk, 'adlun fiyya qada'uk, as'aluka bikulli ismin huwa lak, sammayta bihi nafsak, aw 'allamtahu ahadan min khalqik, aw anzaltahu fi kitabik, awista'tharta bihi fi 'ilmil-ghaybi 'indak, an taj'alal-qur'ana rabi'a qalbi, wa nura sadri, wa jala'a huzni, wa dhahaba hammi.",
        contentEn:
            "O Allah, I am Your servant, son of Your servant, son of Your maidservant. My forelock is in Your hand. Your judgment upon me is assured and Your decree concerning me is just. I ask You by every name belonging to You, which You named Yourself, or revealed in Your Book, or taught to any of Your creation, or kept unto Yourself in the knowledge of the unseen, that You make the Qur'an the spring of my heart, the light of my chest, and the departure of my sorrow and the dispeller of my anxiety.",
        description: """
عن عبد الله بن مسعود رضي الله عنه قال: قال رسول الله- صلى الله عليه وسلم-: «مَا أَصَابَ أَحَداً قَطُّ هَمٌّ وَلا حُزْنٌ فَقَالَ: اللَّهُمَّ إنِّي عَبْدُكَ، وَابْنُ عَبْدِكَ، وَابْنُ أَمَتِكَ نَاصِيَتِي بِيَدِكَ، مَاضٍ فِيَّ حُكْمُكَ، عَدْلٌ فِيَّ قَضَاؤُكَ، أَسْأَلُكَ بِكُلِّ اسْمٍ هُوَ لَكَ سَمَّيْتَ بِهِ نَفْسَكَ، أَوْ عَلَّمْتَهُ أَحَداً مِن خَلْقِكَ، أَوْ أَنْزَلْتَهُ فِي كِتَابِكَ، أَوْ اسْتَأْثَرْتَ بِهِ فِي عِلْمِ الغَيْبِ عِنْدَكَ، أَنْ تَجْعَلَ القُرآنَ رَبِيعَ قَلْبِي، وَنُورَ صَدْرِي، وَجِلاءَ حُزْنِي وَذَهَابَ هَمِّي، إلَّا أَذْهَبَ الله هَمَّهُ وَحُزْنَهُ وَأَبْدَلَهُ مَكَانَهُ فَرَحَاً» قَالَ: فَقِيلَ: يَا رَسُولَ الله ألا نَتَعَلَّمُهَا فَقَالَ: «بَلَى يَنْبَغِي لِمَنْ سَمِعَهَا أَنْ يَتَعَلَّمَهَا». أخرجه أحمد.
""",
        descriptionEn:
            "Abdullah ibn Mas'ud (may Allah be pleased with him) reported that the Messenger of Allah ﷺ said: \"No one is afflicted with anxiety or sorrow and says [the above] except that Allah removes his anxiety and sorrow and replaces it with joy.\" It was said: O Messenger of Allah, should we not learn it? He said: \"Yes, it is fitting for whoever hears it to learn it.\" Reported by Ahmad."),
    const ZikrEntity(
        id: 12,
        key: 'condition_012',
        category: 'fearOfPeople',
        titleEn: "Fear of People",
        count: 1,
        title: "عند الخوف من قوم",
        content:
            "اللَّهُمَّ إنَّا نَجْعَلُكَ فِي نُحُورِهِمْ، وَنَعُوذُ بِكَ مِنْ شُرُورِهِمْ",
        contentTransliteration:
            "Allahumma inna naj'aluka fi nuhurihim, wa na'udhu bika min shururihim.",
        contentEn:
            "O Allah, we place You before them and we take refuge in You from their evil.",
        description: """
أنَّ النبيَّ صلَّى اللهُ عليهِ وسلَّمَ كان إذا خاف قومًا قال : اللهمَّ إنَّا نجعلُكَ في نحورهم ، ونعوذُ بكَ من شرورهم.الراوي أبو موسى الأشعري أخرجه أبو داود واللفظ له، وأحمد باختلاف يسيرو إسناده صحيح""",
        descriptionEn:
            "Abu Musa al-Ash'ari (may Allah be pleased with him) reported that when the Prophet ﷺ feared a people, he would say the above. Reported by Abu Dawud, and by Ahmad with slight variation; its chain is authentic."),
    const ZikrEntity(
        id: 13,
        key: 'condition_013',
        category: 'meetingEnemy',
        titleEn: "Meeting an Enemy",
        count: 1,
        title: "عند لقاء العدو",
        content: "حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ",
        contentTransliteration: "Hasbunallahu wa ni'mal-wakil.",
        contentEn:
            "Allah is sufficient for us, and He is the best disposer of affairs.",
        description: """
وعن ابن عباس رضي الله عنهما: {حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ} قَالَهَا إبرَاهِيمُ عَلَيهِ السَّلامُ حِينَ أُلْقِيَ فِي النَّارِ، وَقَالَهَا مُحَمَّدٌ- صلى الله عليه وسلم- حِينَ قَالُوا: {إِنَّ النَّاسَ قَدْ جَمَعُوا لَكُمْ فَاخْشَوْهُمْ فَزَادَهُمْ إِيمَانًا وَقَالُوا حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ}.
أخرجه البخاري.
""",
        descriptionEn:
            "Ibn Abbas (may Allah be pleased with them both) said: \"Allah is sufficient for us, and He is the best disposer of affairs\" was said by Abraham (peace be upon him) when he was thrown into the fire, and it was said by Muhammad ﷺ when they said: \"The people have gathered against you, so fear them,\" but it increased them in faith and they said: \"Allah is sufficient for us, and He is the best disposer of affairs.\" Reported by al-Bukhari."),
    const ZikrEntity(
        id: 14,
        key: 'condition_014',
        category: 'overwhelmed',
        titleEn: "When Overwhelmed",
        count: 1,
        title: "إذا غلبك أمر",
        content: "قَدَرُ الله وَمَا شَاءَ فَعَلَ",
        contentTransliteration: "Qadarullahi wa ma sha'a fa'al.",
        contentEn: "It is the decree of Allah, and what He wills, He does.",
        description: """
عن أبي هريرة رضي الله عنه قال: قال رسول الله- صلى الله عليه وسلم-: «المُؤْمِنُ القَوِيُّ خَيرٌ وَأَحَبُّ إلَى الله مِنَ المُؤْمِنِ الضَّعِيفِ، وَفِي كُلٍّ خَيْرٌ، احْرِصْ عَلَى مَا يَنْفَعُكَ، وَاسْتَعِنْ بِالله وَلا تَعْجَزْ، وَإنْ أَصَابَكَ شَيْءٌ فَلا تَقُلْ: لَو أَنِّي فَعَلْتُ كَانَ كَذَا وَكَذَا، وَلَكِنْ قُلْ: قَدَرُ الله وَمَا شَاءَ فَعَلَ، فَإنَّ لَوْ تَفْتَحُ عَمَلَ الشَّيْطَانِ». أخرجه مسلم""",
        descriptionEn:
            "Abu Hurairah (may Allah be pleased with him) reported that the Messenger of Allah ﷺ said: \"The strong believer is better and more beloved to Allah than the weak believer, though there is good in both. Cherish what benefits you, seek help from Allah, and do not be overcome by helplessness. If something befalls you, do not say: 'If only I had done such and such,' but rather say: 'It is the decree of Allah, and what He wills, He does,' for 'if only' opens the door to the work of Satan.\" Reported by Muslim."),
    const ZikrEntity(
        id: 15,
        key: 'condition_015',
        category: 'afterSin',
        titleEn: "After a Sin",
        count: 1,
        title: "عند فعل ذنب",
        content:
            "فَيُحْسِنُ الطُّهُورَ، ثُمَّ يَقُومُ فَيُصَلِّي رَكْعَتَينِ، ثُمَّ يَسْتَغْفِرُ الله",
        contentEn:
            "He performs ablution well, then stands and prays two rak'ahs, then seeks Allah's forgiveness.",
        description: """
عن أبي بكر رضي الله عنه قال: سمعت رسول الله- صلى الله عليه وسلم- يقول: «مَا مِنْ عَبْدٍ يُذْنِبُ ذَنْباً فَيُحْسِنُ الطُّهُورَ، ثُمَّ يَقُومُ فَيُصَلِّي رَكْعَتَينِ، ثُمَّ يَسْتَغْفِرُ الله إلَّا غَفَرَ الله لَهُ»، ثم قرأ هذه الآية: {وَالَّذِينَ إِذَا فَعَلُوا فَاحِشَةً أَوْ ظَلَمُوا أَنْفُسَهُمْ ذَكَرُوا اللَّهَ} إلى آخر الآية. أخرجه أبو داود والترمذي
""",
        descriptionEn:
            "Abu Bakr (may Allah be pleased with him) said: I heard the Messenger of Allah ﷺ say: \"There is no servant who commits a sin, then performs ablution well, stands and prays two rak'ahs, then seeks Allah's forgiveness, except that Allah forgives him.\" Then he recited: \"And those who, when they commit an immorality or wrong themselves, remember Allah...\" to the end of the verse. Reported by Abu Dawud and at-Tirmidhi."),
    const ZikrEntity(
        id: 16,
        key: 'condition_016',
        category: 'unpaidDebt',
        titleEn: "Unpaid Debt",
        count: 1,
        title: "من عليه دين عجز عنه",
        content:
            "اللَّهُمَّ اكْفِنِي بِحَلالِكَ عَنْ حَرَامِكَ، وَأَغَنِنِي بِفَضْلِكَ عَمَّنْ سِوَاكَ",
        contentTransliteration:
            "Allahummakfini bihalalika 'an haramik, wa aghnini bifadlika 'amman siwak.",
        contentEn:
            "O Allah, suffice me with what You have made lawful instead of what You have made unlawful, and make me independent of all others besides You by Your bounty.",
        description: """
عن علي رضي الله عنه أَنَّ مُكَاتَباً جَاءَهُ فَقَالَ: إنِّي قَدْ عَجَزْتُ عَنْ كِتَابَتِي فَأَعِنِّي قَالَ: أَلا أُعَلِّمُكَ كَلِمَاتٍ عَلَّمَنِيهِنَّ رَسُولُ الله- صلى الله عليه وسلم- لَوْ كَانَ عَلَيْكَ مِثْلُ جَبَلِ ثَبِيرٍ دَيْناً أَدَّاهُ الله عَنْكَ؟ قال: قُلْ: «اللَّهُمَّ اكْفِنِي بِحَلالِكَ عَنْ حَرَامِكَ، وَأَغَنِنِي بِفَضْلِكَ عَمَّنْ سِوَاكَ». أخرجه الترمذي""",
        descriptionEn:
            "Ali (may Allah be pleased with him) reported that a slave under a contract of manumission came to him and said: I am unable to pay off my contract, so help me. Ali said: Shall I not teach you words that the Messenger of Allah ﷺ taught me, such that even if you owed a debt like Mount Thabir, Allah would settle it for you? Say: [the above]. Reported by at-Tirmidhi."),
    const ZikrEntity(
        id: 17,
        key: 'condition_017',
        category: 'anger',
        titleEn: "Anger",
        count: 1,
        title: "عند الغضب",
        content: "أَعُوذُ بِالله مِنَ الشَّيْطَانِ الرَّجِيمِ",
        contentTransliteration: "A'udhu billahi minash-shaytanir-rajim.",
        contentEn: "I take refuge in Allah from the accursed Satan.",
        description: """
عن سليمان بن صُرَد رضي الله عنه قال: اسْتَبَّ رَجُلانِ عِنْدَ النَّبِيِّ- صلى الله عليه وسلم- وَنَحْنُ عِنْدَهُ جُلُوسٌ وَأَحَدُهُمَا يَسُبُّ صَاحِبَهُ مُغْضَباً قَدِ احْمَرَّ وَجْهُهُ فَقَالَ النَّبِيُّ- صلى الله عليه وسلم-: «إنِّي لأَعْلَمُ كَلِمَةً لَو قَالَهَا لَذَهَبَ عَنْهُ مَا يَجِدُ، لَو قَالَ: أَعُوذُ بِالله مِنَ الشَّيْطَانِ الرَّجِيمِ..». رواه البخاري.

""",
        descriptionEn:
            "Sulayman ibn Surad (may Allah be pleased with him) said: Two men insulted each other in front of the Prophet ﷺ while we were sitting with him, and one of them was cursing his companion in anger, his face reddened. The Prophet ﷺ said: \"I know a word which, if he said it, what he feels would leave him: if he said, 'I take refuge in Allah from the accursed Satan.'\" Reported by al-Bukhari."),
    const ZikrEntity(
        id: 18,
        key: 'condition_018',
        category: 'leavingGathering',
        titleEn: "Leaving a Gathering",
        count: 1,
        title: "عند القيام من المجلس",
        content:
            "سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ، أَشْهَدُ أَنْ لا إلَهَ إلَّا أَنْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إلَيْكَ",
        contentTransliteration:
            "Subhanaka Allahumma wa bihamdik, ash-hadu an la ilaha illa ant, astaghfiruka wa atubu ilayk.",
        contentEn:
            "Glory is to You, O Allah, and praise is to You. I bear witness that none has the right to be worshipped except You. I seek Your forgiveness and turn to You in repentance.",
        description: """
عن أبي هريرة رضي الله عنه قال: قال رسول الله- صلى الله عليه وسلم-: «مَنْ جَلَسَ فِي مَجْلِسٍ فَكَثُرَ فِيهِ لَغَطُهُ فَقَالَ قَبْلَ أَنْ يَقُومَ مِنْ مَجْلِسِهِ ذَلِكَ: سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ، أَشْهَدُ أَنْ لا إلَهَ إلَّا أَنْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إلَيْكَ، إلَّا غُفِرَ لَهُ مَا كَانَ فِي مَجْلِسِهِ ذَلِكَ». أخرجه أحمد والترمذي
""",
        descriptionEn:
            "Abu Hurairah (may Allah be pleased with him) reported that the Messenger of Allah ﷺ said: \"Whoever sits in a gathering where there is much clamor, and before rising says: [the above], will be forgiven for whatever occurred in that gathering.\" Reported by Ahmad and at-Tirmidhi."),
    const ZikrEntity(
        id: 19,
        key: 'condition_019',
        category: 'seeingAfflicted',
        titleEn: "Seeing the Afflicted",
        count: 1,
        title: "إذا رأى مبتلى بمرض أو غيره",
        content:
            "الحمدُ للهِ الذي عافاني مما ابتلاكَ به ، و فضَّلني على كثيرٍ ممن خلق تفضيلًا",
        contentTransliteration:
            "Alhamdu lillahilladhi 'afani mimmab-talaka bihi, wa faddalani 'ala kathirin mimman khalaqa tafdila.",
        contentEn:
            "Praise be to Allah who has spared me from what He has afflicted you with, and has favored me above much of what He has created.",
        description: """
عن ابن عمر رضي الله عنهما قال: قال رسول الله- صلى الله عليه وسلم-: «مَنْ رَأَى مُبْتَلَىً فَقَالَ: الحَمْدُ للهِ الَّذِي عَافَانِي مِمَّا ابْتَلاكَ بِهِ، وَفَضَّلَنِي عَلَى كَثِيرٍ مِمَّنْ خَلَقَ تَفْضِيلاً لَمْ يُصِبْهُ ذَلِكَ البَلاءُ». أخرجه الطبراني في الأوسط.
""",
        descriptionEn:
            "Ibn Umar (may Allah be pleased with them both) reported that the Messenger of Allah ﷺ said: \"Whoever sees a person afflicted and says: [the above], will not be struck by that affliction.\" Reported by at-Tabarani in al-Awsat."),
    const ZikrEntity(
        id: 20,
        key: 'condition_020',
        category: 'sleep',
        titleEn: "Sleep",
        count: 1,
        title: "عند النوم",
        content:
            "باسمِكَ ربي وضعْتُ جنبي وبكَ أرْفَعُهُ فإِنْ أمسَكْتَ نفسي فارحمْها وإِنْ أرسلْتَها فاحفظْها بِما تحفَظُ بِهِ عبادَكَ الصالِحينَ",
        contentTransliteration:
            "Bismika rabbi wada'tu janbi, wa bika arfa'uh, fa'in amsakta nafsi farhamha, wa in arsaltaha fahfazha bima tahfazu bihi 'ibadakas-salihin.",
        contentEn:
            "In Your name, my Lord, I lay down my side, and by You I raise it. If You take my soul, then have mercy upon it, and if You release it, then protect it as You protect Your righteous servants.",
        description: """
إذا أوَى أحَدُكُمْ إلى فِراشِهِ، فَلْيَنْفُضْ فِراشَهُ بداخِلَةِ إزارِهِ؛ فإنَّه لا يَدْرِي ما خَلَفَهُ عليه، ثُمَّ يقولُ: باسْمِكَ رَبِّ، وضَعْتُ جَنْبِي، وبِكَ أرْفَعُهُ، إنْ أمْسَكْتَ نَفْسِي فارْحَمْها، وإنْ أرْسَلْتَها فاحْفَظْها بما تَحْفَظُ به عِبادَكَ الصَّالِحِينَ.
الراوي : أبو هريرة و المحدث : البخاري""",
        descriptionEn:
            "Abu Hurairah (may Allah be pleased with him): The Prophet ﷺ said: \"When one of you goes to his bed, let him dust it off with the inside of his garment, for he does not know what came onto it after he left it; then let him say: [the above].\" Reported by al-Bukhari."),
    const ZikrEntity(
        id: 21,
        key: 'condition_021',
        category: 'wakingUp',
        titleEn: "Waking Up",
        count: 1,
        title: "عند الاستيقاظ",
        content:
            "الحَمْدُ لِلَّهِ الذي أحْيَانَا بَعْدَ ما أمَاتَنَا وإلَيْهِ النُّشُورُ",
        contentTransliteration:
            "Alhamdu lillahilladhi ahyana ba'da ma amatana wa ilayhin-nushur.",
        contentEn:
            "Praise be to Allah who gave us life after having caused us to die, and unto Him is the resurrection.",
        description:
            """كانَ النَّبيُّ صَلَّى اللهُ عليه وسلَّمَ إذَا أرَادَ أنْ يَنَامَ قالَ: باسْمِكَ اللَّهُمَّ أمُوتُ وأَحْيَا، وإذَا اسْتَيْقَظَ مِن مَنَامِهِ قالَ: الحَمْدُ لِلَّهِ الذي أحْيَانَا بَعْدَ ما أمَاتَنَا وإلَيْهِ النُّشُورُ.
الراوي : حذيفة بن اليمان و المحدث : البخاري""",
        descriptionEn:
            "Whenever the Prophet ﷺ wanted to sleep he would say: \"In Your name, O Allah, I die and I live,\" and when he woke from his sleep he would say: [the above]. Narrated by Hudhayfah ibn al-Yaman, reported by al-Bukhari."),
    const ZikrEntity(
        id: 22,
        key: 'condition_022',
        category: 'seeingSomethingPleasing',
        titleEn: "Seeing Something Pleasing",
        count: 1,
        title: "عند رؤية ما يعجبك",
        content: "ما شاء الله أو اللهم بارك فيه",
        contentTransliteration: "Ma sha'Allah / Allahumma barik fih.",
        contentEn: "As Allah has willed / O Allah, bless it.",
        description: """
وَلَوْلا إِذْ دَخَلْتَ جَنَّتَكَ قُلْتَ مَا شَاءَ اللَّهُ لا قُوَّةَ إِلَّا بِاللَّهِ[الكهف:39] .وفي الحديث: إذا رأى أحدُكم ما يُعجبُهُ في نَفسِهِ ، أو مالِهِ فليبرِّكْ علَيهِ فإنَّ العَينَ حقٌّ """,
        descriptionEn:
            "\"[Why did you not say, when you entered your garden, 'What Allah willed [has occurred]; there is no power except in Allah'].\" (Al-Kahf 39). And in the hadith: \"If one of you sees something that pleases him in himself or his wealth, let him invoke a blessing upon it, for the evil eye is real.\""),
    const ZikrEntity(
        id: 23,
        key: 'condition_023',
        category: 'leavingHomeDua',
        titleEn: "Leaving the House",
        count: 1,
        title: "دعاء الخروج من المنزل",
        content:
            "اللَّهُمَّ أَعُوذُ بِكَ أَنْ أَضِلَّ، أَوْ أُضَلَّ، أَوْ أَزِلَّ، أَوْ أُزَلَّ، أَوْ أَظْلِمَ، أَوْ أُظْلَمَ، أَوْ أَجْهَلَ، أَوْ يُجْهَلَ عَلَيَّ",
        contentTransliteration:
            "Allahumma inni a'udhu bika an adilla, aw udalla, aw azilla, aw uzalla, aw azlima, aw uzlama, aw ajhala, aw yujhala 'alayya.",
        contentEn:
            "O Allah, I take refuge in You lest I stray or be led astray, lest I slip or be caused to slip, lest I oppress or be oppressed, lest I behave foolishly or be treated foolishly.",
        description: """
عن أمِّ سلمة رضي الله عنها قالت: ما خرج النبي صلى الله عليه وسلم من بيتي قطُّ إلا رفع طَرْفَهُ إلى السماء فقال: (اللَّهُمَّ أَعُوذُ بِكَ أَنْ أَضِلَّ، أَوْ أُضَلَّ، أَوْ أَزِلَّ، أَوْ أُزَلَّ، أَوْ أَظْلِمَ، أَوْ أُظْلَمَ، أَوْ أَجْهَلَ، أَوْ يُجْهَلَ عَلَيَّ)
""",
        descriptionEn:
            "Umm Salamah (may Allah be pleased with her) said: The Prophet ﷺ never left my house without raising his eyes to the sky and saying the above."),
    const ZikrEntity(
        id: 24,
        key: 'condition_024',
        category: 'travel',
        titleEn: "Travel",
        count: 1,
        title: "دعـاء السفـر",
        content:
            "اللّهُمّ إِنّا نَسْأَلُكَ فِي سَفَرِنَا هَذَا الْبِرّ وَالتّقْوَىَ. وَمِنَ الْعَمَلِ مَا تَرْضَىَ. اللّهُمّ هَوّنْ عَلَيْنَا سَفَرَنَا هَذَا. وَاطْوِ عَنّا بُعْدَهُ. اللّهُمّ أَنْتَ الصّاحِبُ فِي السّفَرِ. وَالْخَلِيفَةُ فِي الأَهْلِ. اللّهُمّ إِنّي أَعُوذُ بِكَ مِنْ وَعْثَاءِ السّفَرِ، وَكَآبَةِ الْمَنْظَرِ، وَسُوءِ الْمُنْقَلَبِ، فِي الْمَالِ وَالأَهْلِ",
        contentTransliteration:
            "Allahumma inna nas'aluka fi safarina hadhal-birra wat-taqwa, wa minal-'amali ma tarda. Allahumma hawwin 'alayna safarana hadha watwi 'anna bu'dah. Allahumma antas-sahibu fis-safar, wal-khalifatu fil-ahl. Allahumma inni a'udhu bika min wa'tha'is-safar, wa ka'abatil-manzar, wa su'il-munqalabi fil-mali wal-ahl.",
        contentEn:
            "O Allah, we ask You for righteousness and piety on this journey of ours, and for deeds that please You. O Allah, make this journey of ours easy and shorten its distance for us. O Allah, You are the Companion on the journey and the Guardian of the family left behind. O Allah, I take refuge in You from the hardships of travel, the sorrow of what we may see, and an ill turn of fortune in wealth and family.",
        description: """
روى مسلم في صحيحه عن ابْنَ عُمَرَ أَنّ رَسُولَ اللّهِ صلى الله عليه وسلم كَانَ إِذَا اسْتَوَىَ عَلَىَ بَعِيرِهِ خَارِجاً إِلَىَ سَفَرٍ، كَبّرَ ثَلاَثاً، ثُمّ قَالَ: سُبْحَانَ الّذِي سَخّرَ لَنَا هَذَا وَمَا كُنّا لَهُ مُقْرِنِينَ* وَإِنّا إِلَىَ رَبّنَا لَمُنْقَلِبُونَ. اللّهُمّ إِنّا نَسْأَلُكَ فِي سَفَرِنَا هَذَا الْبِرّ وَالتّقْوَىَ. وَمِنَ الْعَمَلِ مَا تَرْضَىَ. اللّهُمّ هَوّنْ عَلَيْنَا سَفَرَنَا هَذَا. وَاطْوِ عَنّا بُعْدَهُ. اللّهُمّ أَنْتَ الصّاحِبُ فِي السّفَرِ. وَالْخَلِيفَةُ فِي الأَهْلِ. اللّهُمّ إِنّي أَعُوذُ بِكَ مِنْ وَعْثَاءِ السّفَرِ، وَكَآبَةِ الْمَنْظَرِ، وَسُوءِ الْمُنْقَلَبِ، فِي الْمَالِ وَالأَهْلِ
""",
        descriptionEn:
            "Ibn Umar (may Allah be pleased with them both) reported that whenever the Messenger of Allah ﷺ mounted his camel setting out on a journey, he would say Takbir three times, then say: \"Glory is to Him who has subjected this to us, and we could not have done so [by] ourselves, and to our Lord we will surely return.\" [the above]. Reported by Muslim."),
    const ZikrEntity(
        id: 25,
        key: 'condition_025',
        category: 'ridingMount',
        titleEn: "Riding a Mount",
        count: 1,
        title: "دعاء ركوب الدابة",
        content:
            "سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ * وَإِنَّا إِلَى رَبِّنَا لَمُنْقَلِبُونَ",
        contentTransliteration:
            "Subhanalladhi sakhkhara lana hadha wa ma kunna lahu muqrinin, wa inna ila rabbina lamunqalibun.",
        contentEn:
            "Glory is to Him who has subjected this to us, and we could not have done so [by] ourselves, and to our Lord we will surely return.",
        description: """
لِتَسْتَوُوا عَلَىٰ ظُهُورِهِ ثُمَّ تَذْكُرُوا نِعْمَةَ رَبِّكُمْ إِذَا اسْتَوَيْتُمْ عَلَيْهِ وَتَقُولُوا سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَٰذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ (13) وَإِنَّا إِلَىٰ رَبِّنَا لَمُنقَلِبُونَ [الزخرف 13 - 14]
""",
        descriptionEn:
            "\"That you may settle yourselves upon their backs and then remember the favor of your Lord when you have settled upon them and say: 'Glory is to Him who has subjected this to us, and we could not have done so [by] ourselves. And indeed we, to our Lord, will return.'\" (Az-Zukhruf 13-14)"),
    const ZikrEntity(
        id: 26,
        key: 'condition_026',
        category: 'visitingGraves',
        titleEn: "Visiting Graves",
        count: 1,
        title: "دعاء زيارة القبور",
        content:
            "السلام عليكم أهل الديار من المؤمنين والمسلمين وإنا إن شاء الله بكم لاحقون نسأل الله لنا ولكن العافية",
        contentTransliteration:
            "Assalamu 'alaykum ahlad-diyari minal-mu'minina wal-muslimin, wa inna in sha'Allahu bikum lahiqun, nas'alullaha lana wa lakumul-'afiyah.",
        contentEn:
            "Peace be upon you, inhabitants of these graves, believers and Muslims. We will, Allah willing, join you. We ask Allah for well-being for us and for you.",
        description: """
يسن لزائر المقبرة أن يدعو بما ورد عن النبي صلى الله عليه وسلم، ومن ذلك ما روى مسلم من حديث سليمان بن بريدة عن أبيه، أن النبي صلى الله عليه وسلم كان يعلم أصحابه إذا خرجوا إلى المقابر أن يقولوا: "السلام عليكم أهل الديار من المؤمنين والمسلمين وإنا إن شاء الله بكم لاحقون نسأل الله لنا ولكن العافية."
""",
        descriptionEn:
            "It is recommended for a visitor to the graveyard to supplicate with what has been reported from the Prophet ﷺ, as Muslim narrated from Sulayman ibn Buraydah, on the authority of his father, that the Prophet ﷺ used to teach his Companions that when they went out to the graves they should say the above."),
    const ZikrEntity(
        id: 27,
        key: 'condition_027',
        category: 'afterEating',
        titleEn: "After Eating",
        count: 1,
        title: "دعاء بعد الأكل",
        content:
            "الحمد لله الذي أطعمني هذا، ورزقنيه من غير حول مني ولا قوة",
        contentTransliteration:
            "Alhamdu lillahilladhi at'amani hadha, wa razaqanihi min ghayri hawlin minni wa la quwwah.",
        contentEn:
            "Praise be to Allah who fed me this and provided it for me without any might or power on my part.",
        description: """
عَنْ مُعَاذِ بْنِ أَنَسٍ رضي الله عنه، عَنِ النَّبِيِّ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ قَالَ: مَنْ أَكَلَ طَعَامًا فَقَالَ: الحمد لله الذي أطعمني هذا، ورزقنيه من غير حول مني ولا قوة، غُفِرَ لَهُ مَا تَقَدَّمَ مِنْ ذَنْبِهِ.
رواه أبو داود والترمذي وابن ماجه""",
        descriptionEn:
            "Mu'adh ibn Anas (may Allah be pleased with him) reported that the Prophet ﷺ said: \"Whoever eats food and then says: [the above], his previous sins will be forgiven.\" Reported by Abu Dawud, at-Tirmidhi, and Ibn Majah.")
  ];

  static List<ZikrEntity> ruqyahAzkar = [
    const ZikrEntity(
        id: 27,
        key: 'ruqyah_001',
        category: 'ruqyah',
        titleEn: "Ruqyah",
        count: 1,
        title: 'سورة الفاتحة',
        content: """بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ، الرَّحْمَٰنِ الرَّحِيمِ، مَالِكِ يَوْمِ الدِّينِ، إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ، اهدِنَا الصِّرَاطَ المُستَقِيمَ، صِرَاطَ الَّذِينَ أَنعَمتَ عَلَيهِمْ غَيرِ المَغضُوبِ عَلَيهِمْ وَلَا الضَّالِّينَ""",
        contentTransliteration:
            "Bismillahir-Rahmanir-Rahim. Alhamdu lillahi rabbil-'alamin, ar-Rahmanir-Rahim, maliki yawmid-din, iyyaka na'budu wa iyyaka nasta'in, ihdinas-siratal-mustaqim, siratal-ladhina an'amta 'alayhim ghayril-maghdubi 'alayhim wa lad-dallin.",
        contentEn:
            "In the name of Allah, the Most Gracious, the Most Merciful. All praise is due to Allah, Lord of the worlds, the Most Gracious, the Most Merciful, Master of the Day of Judgment. It is You we worship and You we ask for help. Guide us to the straight path, the path of those upon whom You have bestowed favor, not of those who have evoked [Your] anger or of those who are astray.",
        description:
            """أعظم سورة في القرآن، وهي رقية بإذن الله، كما في حديث أبي سعيد الخدري رضي الله عنه في قصة الرقية بها. متفق عليه.""",
        descriptionEn:
            "The greatest surah in the Qur'an, and it is a ruqyah by Allah's permission, as in the hadith of Abu Sa'id al-Khudri (may Allah be pleased with him) regarding the story of performing ruqyah with it. Agreed upon."),
    const ZikrEntity(
        id: 28,
        key: 'ruqyah_002',
        category: 'ruqyah',
        titleEn: "Ruqyah",
        count: 1,
        title: 'آية الكرسى',
        content: """
أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ  بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيم {اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ} [آية الكرسى - البقرة 255]. """,
        contentTransliteration:
            "Allāhu lā ilāha illā huwa, al-ḥayyu al-qayyūm. Lā ta'khudhuhu sinatun wa lā nawm. Lahu mā fis-samāwāti wa mā fil-arḍ. Man dhal-ladhī yashfa'u 'indahu illā bi-idhnih. Ya'lamu mā bayna aydīhim wa mā khalfahum, wa lā yuḥīṭūna bishay'im min 'ilmihi illā bimā shā'. Wasi'a kursiyyuhus-samāwāti wal-arḍ, wa lā ya'ūduhu ḥifẓuhumā, wa huwal-'aliyyul-'aẓīm.",
        contentEn:
            "Allah - there is no deity except Him, the Ever-Living, the Sustainer of existence. Neither drowsiness overtakes Him nor sleep. To Him belongs whatever is in the heavens and whatever is on the earth. Who is it that can intercede with Him except by His permission? He knows what is before them and what will be after them, and they encompass not a thing of His knowledge except for what He wills. His Kursi extends over the heavens and the earth, and their preservation tires Him not. And He is the Most High, the Most Great.",
        description:
            """من أعظم آيات القرآن في الحفظ والرقية، من قرأها حين يصبح أُجير من الجن حتى يُمسي. رواه الحاكم وصححه الألباني.""",
        descriptionEn:
            "One of the greatest verses in the Qur'an for protection and ruqyah; whoever recites it in the morning is protected from the jinn until evening. Reported by al-Hakim and authenticated by al-Albani."),
    const ZikrEntity(
        id: 29,
        key: 'ruqyah_003',
        category: 'ruqyah',
        titleEn: "Ruqyah",
        count: 1,
        title: 'آخر آيتين من سورة البقرة',
        content: """أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ
{آمَنَ الرَّسُولُ بِمَا أُنْزِلَ إِلَيْهِ مِنْ رَبِّهِ وَالْمُؤْمِنُونَ ۚ كُلٌّ آمَنَ بِاللَّهِ وَمَلَائِكَتِهِ وَكُتُبِهِ وَرُسُلِهِ لَا نُفَرِّقُ بَيْنَ أَحَدٍ مِنْ رُسُلِهِ ۚ وَقَالُوا سَمِعْنَا وَأَطَعْنَا ۖ غُفْرَانَكَ رَبَّنَا وَإِلَيْكَ الْمَصِيرُ. لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا لَهَا مَا كَسَبَتْ وَعَلَيْهَا مَا اكْتَسَبَتْ رَبَّنَا لَا تُؤَاخِذْنَا إِنْ نَّسِينَآ أَوْ أَخْطَأْنَا رَبَّنَا وَلَا تَحْمِلْ عَلَيْنَا إِصْرًا كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِنْ قَبْلِنَا رَبَّنَا وَلَا تُحَمِّلْنَا مَا لَا طَاقَةَ لَنَا بِهِ وَاعْفُ عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَا أَنْتَ مَوْلَانَا فَانْصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ.} [البقرة 285 - 286].""",
        contentTransliteration:
            "A'udhu billahi minash-shaytanir-rajim. Amanar-rasulu bima unzila ilayhi mir-rabbihi wal-mu'minun, kullun amana billahi wa mala'ikatihi wa kutubihi wa rusulih, la nufarriqu bayna ahadim-mir-rusulih, wa qalu sami'na wa ata'na ghufranaka rabbana wa ilaykal-masir. La yukallifullahu nafsan illa wus'aha, laha ma kasabat wa 'alayha mak-tasabat, rabbana la tu'akhidhna in nasina aw akhta'na, rabbana wa la tahmil 'alayna isran kama hamaltahu 'alal-ladhina min qablina, rabbana wa la tuhammilna ma la taqata lana bih, wa'fu 'anna waghfir lana warhamna anta mawlana fansurna 'alal-qawmil-kafirin.",
        contentEn:
            "I seek refuge in Allah from the accursed Satan. The Messenger has believed in what was revealed to him from his Lord, and [so have] the believers. All of them have believed in Allah and His angels and His books and His messengers, [saying], 'We make no distinction between any of His messengers.' And they say, 'We hear and we obey. [We seek] Your forgiveness, our Lord, and to You is the [final] destination.' Allah does not charge a soul except with that within its capacity. It will have [the consequence of] what [good] it has gained, and it will bear [the consequence of] what [evil] it has earned. 'Our Lord, do not impose blame upon us if we have forgotten or erred. Our Lord, and lay not upon us a burden like that which You laid upon those before us. Our Lord, and burden us not with that which we have no ability to bear. And pardon us; and forgive us; and have mercy upon us. You are our protector, so give us victory over the disbelieving people.'",
        description:
            """من قرأهما في ليلة كفتاه، وهما من كنوز القرآن التي أُعطيها النبي ﷺ. رواه البخاري ومسلم.""",
        descriptionEn:
            "Whoever recites them at night, they will suffice him; they are among the treasures given exclusively to the Prophet ﷺ. Reported by al-Bukhari and Muslim."),
    const ZikrEntity(
        id: 30,
        key: 'ruqyah_004',
        category: 'ruqyah',
        titleEn: "Ruqyah",
        count: 3,
        title: 'سورة الإخلاص (×3)',
        content: """بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
قُلْ هُوَ ٱللَّهُ أَحَدٌ، ٱللَّهُ ٱلصَّمَدُ، لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُن لَّهُۥ كُفُوًا أَحَدٌۢ""",
        contentTransliteration:
            "Qul huwa Allāhu aḥad, Allāhuṣ-ṣamad, lam yalid wa lam yūlad, wa lam yakun lahu kufuwan aḥad.",
        contentEn:
            "Say: He is Allah, the One. Allah, the Eternal Refuge. He neither begets nor is born, nor is there to Him any equivalent.",
        description:
            """تُقرأ ثلاث مرات ضمن الرقية الشرعية بالمعوذات، اقتداءً بفعل النبي ﷺ عند رقية نفسه. متفق عليه.""",
        descriptionEn:
            "Recited three times as part of the legislated ruqyah with al-Mu'awwidhat, following the example of the Prophet ﷺ when performing ruqyah upon himself. Agreed upon."),
    const ZikrEntity(
        id: 31,
        key: 'ruqyah_005',
        category: 'ruqyah',
        titleEn: "Ruqyah",
        count: 3,
        title: 'سورة الفلق (×3)',
        content: """بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
قُلْ أَعُوذُ بِرَبِّ ٱلْفَلَقِ، مِن شَرِّ مَا خَلَقَ، وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ، وَمِن شَرِّ ٱلنَّفَّٰثَٰتِ فِى ٱلْعُقَدِ، وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ""",
        contentTransliteration:
            "Qul a'ūdhu birabbil-falaq, min sharri mā khalaq, wa min sharri ghāsiqin idhā waqab, wa min sharrin-naffāthāti fil-'uqad, wa min sharri ḥāsidin idhā ḥasad.",
        contentEn:
            "Say: I seek refuge in the Lord of daybreak, from the evil of that which He created, and from the evil of darkness when it settles, and from the evil of the blowers in knots, and from the evil of an envier when he envies.",
        description:
            """تُقرأ ثلاث مرات ضمن الرقية الشرعية بالمعوذات، اقتداءً بفعل النبي ﷺ عند رقية نفسه. متفق عليه.""",
        descriptionEn:
            "Recited three times as part of the legislated ruqyah with al-Mu'awwidhat, following the example of the Prophet ﷺ when performing ruqyah upon himself. Agreed upon."),
    const ZikrEntity(
        id: 32,
        key: 'ruqyah_006',
        category: 'ruqyah',
        titleEn: "Ruqyah",
        count: 3,
        title: 'سورة الناس (×3)',
        content: """بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ، مَلِكِ ٱلنَّاسِ، إِلَٰهِ ٱلنَّاسِ، مِن شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ، ٱلَّذِى يُوَسْوِسُ فِى صُدُورِ ٱلنَّاسِ، مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ.""",
        contentTransliteration:
            "Qul a'ūdhu birabbin-nās, malikin-nās, ilāhin-nās, min sharril-waswāsil-khannās, alladhī yuwaswisu fī ṣudūrin-nās, minal-jinnati wan-nās.",
        contentEn:
            "Say: I seek refuge in the Lord of mankind, the Sovereign of mankind, the God of mankind, from the evil of the retreating whisperer who whispers [evil] into the breasts of mankind, from among the jinn and mankind.",
        description:
            """تُقرأ ثلاث مرات ضمن الرقية الشرعية بالمعوذات، اقتداءً بفعل النبي ﷺ عند رقية نفسه. متفق عليه.""",
        descriptionEn:
            "Recited three times as part of the legislated ruqyah with al-Mu'awwidhat, following the example of the Prophet ﷺ when performing ruqyah upon himself. Agreed upon."),
    const ZikrEntity(
        id: 33,
        key: 'ruqyah_007',
        category: 'ruqyah',
        titleEn: "Ruqyah",
        count: 1,
        title: 'أذهب الباس',
        content:
            "أَذْهِبِ الْبَاْسَ رَبَّ النَّاسِ، اشْفِ أَنْتَ الشَّافِي، لَا شِفَاءَ إِلَّا شِفَاؤُكَ، شِفَاءً لَا يُغَادِرُ سَقَمًا",
        contentTransliteration:
            "Adhhibil-ba'sa rabban-nas, washfi antash-shafi, la shifa'a illa shifa'uk, shifa'an la yughadiru saqama.",
        contentEn:
            "Remove the affliction, Lord of mankind, and grant healing, for You are the Healer. There is no healing but Yours, a healing that leaves no illness behind.",
        description:
            """كان النبي ﷺ يرقي بها بعض أهله، يمسح بيده اليمنى ويقول: أذهب الباس رب الناس، اشف أنت الشافي، لا شفاء إلا شفاؤك، شفاءً لا يغادر سقماً. متفق عليه.""",
        descriptionEn:
            "The Prophet ﷺ used to perform ruqyah upon some of his family, wiping with his right hand and saying the above. Agreed upon."),
    const ZikrEntity(
        id: 34,
        key: 'ruqyah_008',
        category: 'ruqyah',
        titleEn: "Ruqyah",
        count: 1,
        title: 'بسم الله أرقيك',
        content:
            "بِسْمِ اللَّهِ أَرْقِيكَ مِنْ كُلِّ شَيْءٍ يُؤْذِيكَ، مِنْ شَرِّ كُلِّ نَفْسٍ أَوْ عَيْنِ حَاسِدٍ اللَّهُ يَشْفِيكَ، بِسْمِ اللَّهِ أَرْقِيكَ",
        contentTransliteration:
            "Bismillahi arqik, min kulli shay'in yu'dhik, min sharri kulli nafsin aw 'aynin hasid, Allahu yashfik, bismillahi arqik.",
        contentEn:
            "In the name of Allah I perform ruqyah upon you, from everything that troubles you, from the evil of every soul or envious eye, may Allah heal you. In the name of Allah I perform ruqyah upon you.",
        description:
            """رقية جبريل عليه السلام للنبي ﷺ، رواها مسلم عن أبي سعيد الخدري رضي الله عنه.""",
        descriptionEn:
            "The ruqyah of Gabriel (peace be upon him) for the Prophet ﷺ, reported by Muslim from Abu Sa'id al-Khudri (may Allah be pleased with him)."),
  ];

  static List<ZikrEntity> afterPrayerAzkar = [
    const ZikrEntity(
        id: 35,
        key: 'afterPrayer_001',
        category: 'afterPrayer',
        titleEn: "After Prayer",
        count: 3,
        title: 'الاستغفار (×3)',
        content: "أستغفر الله",
        contentTransliteration: "Astaghfirullah.",
        contentEn: "I seek the forgiveness of Allah.",
        description:
            """كان النبي ﷺ إذا سلَّم من صلاته استغفر ثلاثاً. رواه مسلم عن ثوبان رضي الله عنه.""",
        descriptionEn:
            "Whenever the Prophet ﷺ finished his prayer he would seek Allah's forgiveness three times. Reported by Muslim from Thawban (may Allah be pleased with him)."),
    const ZikrEntity(
        id: 36,
        key: 'afterPrayer_002',
        category: 'afterPrayer',
        titleEn: "After Prayer",
        count: 1,
        title: 'اللهم أنت السلام',
        content:
            "اللَّهُمَّ أَنْتَ السَّلَامُ وَمِنْكَ السَّلَامُ تَبَارَكْتَ يَا ذَا الْجَلَالِ وَالْإِكْرَامِ",
        contentTransliteration:
            "Allahumma antas-salamu wa minkas-salam, tabarakta ya dhal-jalali wal-ikram.",
        contentEn:
            "O Allah, You are Peace and from You comes peace. Blessed are You, O Owner of majesty and honor.",
        description:
            """كان النبي ﷺ يقولها عقب الاستغفار بعد كل صلاة. رواه مسلم عن ثوبان رضي الله عنه.""",
        descriptionEn:
            "The Prophet ﷺ would say this after seeking forgiveness following every prayer. Reported by Muslim from Thawban (may Allah be pleased with him)."),
    const ZikrEntity(
        id: 37,
        key: 'afterPrayer_003',
        category: 'afterPrayer',
        titleEn: "After Prayer",
        count: 1,
        title: 'آية الكرسى',
        content: """
أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ  بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيم {اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ} [آية الكرسى - البقرة 255]. """,
        contentTransliteration:
            "Allāhu lā ilāha illā huwa, al-ḥayyu al-qayyūm. Lā ta'khudhuhu sinatun wa lā nawm. Lahu mā fis-samāwāti wa mā fil-arḍ. Man dhal-ladhī yashfa'u 'indahu illā bi-idhnih. Ya'lamu mā bayna aydīhim wa mā khalfahum, wa lā yuḥīṭūna bishay'im min 'ilmihi illā bimā shā'. Wasi'a kursiyyuhus-samāwāti wal-arḍ, wa lā ya'ūduhu ḥifẓuhumā, wa huwal-'aliyyul-'aẓīm.",
        contentEn:
            "Allah - there is no deity except Him, the Ever-Living, the Sustainer of existence. Neither drowsiness overtakes Him nor sleep. To Him belongs whatever is in the heavens and whatever is on the earth. Who is it that can intercede with Him except by His permission? He knows what is before them and what will be after them, and they encompass not a thing of His knowledge except for what He wills. His Kursi extends over the heavens and the earth, and their preservation tires Him not. And He is the Most High, the Most Great.",
        description:
            """من قرأها دبر كل صلاة مكتوبة لم يمنعه من دخول الجنة إلا أن يموت. رواه النسائي وصححه الألباني.""",
        descriptionEn:
            "Whoever recites it after every obligatory prayer, nothing prevents him from entering Paradise except death. Reported by an-Nasa'i and authenticated by al-Albani."),
    const ZikrEntity(
        id: 38,
        key: 'afterPrayer_004',
        category: 'afterPrayer',
        titleEn: "After Prayer",
        count: 33,
        title: 'سبحان الله (×33)',
        content: "سبحان الله",
        contentTransliteration: "Subhan Allah.",
        contentEn: "Glory be to Allah.",
        description:
            """من سبَّح الله دبر كل صلاة ثلاثاً وثلاثين، وحمد الله ثلاثاً وثلاثين، وكبَّر الله ثلاثاً وثلاثين، فتلك تسع وتسعون، وقال تمام المائة: لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير، غُفرت خطاياه وإن كانت مثل زبد البحر. رواه مسلم عن أبي هريرة رضي الله عنه.""",
        descriptionEn:
            "Whoever glorifies Allah thirty-three times after every prayer, praises Allah thirty-three times, and magnifies Allah thirty-three times, that is ninety-nine, and completes a hundred by saying: \"There is no god but Allah, alone, without partner; His is the dominion and His is the praise, and He is over all things competent,\" his sins will be forgiven even if they are like the foam of the sea. Reported by Muslim from Abu Hurairah (may Allah be pleased with him)."),
    const ZikrEntity(
        id: 39,
        key: 'afterPrayer_005',
        category: 'afterPrayer',
        titleEn: "After Prayer",
        count: 33,
        title: 'الحمد لله (×33)',
        content: "الحمد لله",
        contentTransliteration: "Alhamdu lillah.",
        contentEn: "Praise be to Allah.",
        description:
            """جزء من تسبيح ما بعد الصلاة الوارد في حديث أبي هريرة رضي الله عنه. رواه مسلم.""",
        descriptionEn:
            "Part of the tasbih recited after prayer, as mentioned in the hadith of Abu Hurairah (may Allah be pleased with him). Reported by Muslim."),
    const ZikrEntity(
        id: 40,
        key: 'afterPrayer_006',
        category: 'afterPrayer',
        titleEn: "After Prayer",
        count: 34,
        title: 'الله أكبر (×34)',
        content: "الله أكبر",
        contentTransliteration: "Allahu Akbar.",
        contentEn: "Allah is the Greatest.",
        description:
            """تمام التسبيح والتحميد والتكبير دبر كل صلاة أربعاً وثلاثين تكبيرة. رواه مسلم عن أبي هريرة رضي الله عنه.""",
        descriptionEn:
            "The completion of the tasbih, tahmid, and takbir after every prayer, thirty-four times. Reported by Muslim from Abu Hurairah (may Allah be pleased with him)."),
    const ZikrEntity(
        id: 41,
        key: 'afterPrayer_007',
        category: 'afterPrayer',
        titleEn: "After Prayer",
        count: 1,
        title: 'لا إله إلا الله وحده',
        content:
            "لا إله إلا الله وحده لا شريك له له الملك وله الحمد وهو على كل شيء قدير",
        contentTransliteration:
            "La ilaha illa Allah wahdahu la sharika lah, lahul mulku wa lahul hamdu wa huwa ala kulli shay'in qadir.",
        contentEn:
            "There is no god but Allah, alone, without partner; His is the dominion and His is the praise, and He is over all things competent.",
        description:
            """في حديث أبي هريرة يقول رسول الله ﷺ:(لا إلَهَ إلَّا اللَّهُ، وحْدَهُ لا شَرِيكَ له، له المُلْكُ وله الحَمْدُ، وهو علَى كُلِّ شَيءٍ قَدِيرٌ، في يَومٍ مِئَةَ مَرَّةٍ؛ كانَتْ له عَدْلَ عَشْرِ رِقابٍ، وكُتِبَتْ له مِئَةُ حَسَنَةٍ، ومُحِيَتْ عنْه مِئَةُ سَيِّئَةٍ...). رواه البخاري""",
        descriptionEn:
            "In the hadith of Abu Hurairah, the Messenger of Allah ﷺ said: \"Whoever says [the above] a hundred times in a day, it is equal to freeing ten slaves, a hundred good deeds are recorded for him, a hundred bad deeds are wiped away from him...\" Reported by al-Bukhari."),
    const ZikrEntity(
        id: 42,
        key: 'afterPrayer_008',
        category: 'afterPrayer',
        titleEn: "After Prayer",
        count: 3,
        title: 'المعوذتان (×3)',
        content: """بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
قُلْ أَعُوذُ بِرَبِّ ٱلْفَلَقِ، مِن شَرِّ مَا خَلَقَ، وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ، وَمِن شَرِّ ٱلنَّفَّٰثَٰتِ فِى ٱلْعُقَدِ، وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ
بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ، مَلِكِ ٱلنَّاسِ، إِلَٰهِ ٱلنَّاسِ، مِن شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ، ٱلَّذِى يُوَسْوِسُ فِى صُدُورِ ٱلنَّاسِ، مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ.""",
        contentTransliteration:
            "Qul a'ūdhu birabbil-falaq, min sharri mā khalaq, wa min sharri ghāsiqin idhā waqab, wa min sharrin-naffāthāti fil-'uqad, wa min sharri ḥāsidin idhā ḥasad. Qul a'ūdhu birabbin-nās, malikin-nās, ilāhin-nās, min sharril-waswāsil-khannās, alladhī yuwaswisu fī ṣudūrin-nās, minal-jinnati wan-nās.",
        contentEn:
            "Say: I seek refuge in the Lord of daybreak, from the evil of that which He created, and from the evil of darkness when it settles, and from the evil of the blowers in knots, and from the evil of an envier when he envies. Say: I seek refuge in the Lord of mankind, the Sovereign of mankind, the God of mankind, from the evil of the retreating whisperer who whispers [evil] into the breasts of mankind, from among the jinn and mankind.",
        description:
            """أمر النبي ﷺ عقبة بن عامر أن يقرأ بالمعوذتين دبر كل صلاة. رواه أبو داود والترمذي وصححه الألباني.""",
        descriptionEn:
            "The Prophet ﷺ commanded 'Uqbah ibn 'Amir to recite al-Mu'awwidhatan after every prayer. Reported by Abu Dawud and at-Tirmidhi, authenticated by al-Albani."),
  ];

  static List<PrayerEntity> prayers = [
    const PrayerEntity(
        id: 0,
        content: "اللهم إنك عفو كريم تحب العفو، فاعفُ عني",
        transliteration:
            "Allahumma innaka 'afuwwun karim tuhibbul-'afwa fa'fu 'anni",
        translation:
            "O Allah, You are Forgiving and Generous, You love to forgive, so forgive me."),
    const PrayerEntity(
        id: 1,
        content:
            "اللهم ربنا لك الحمد أنت قيّم السماوات والأرض، ولك الحمد أنت رب السماوات والأرض ومن فيهن، ولك الحمد أنت نور السماوات والأرض ومن فيهن، أنت الحق، وقولك الحق، ووعدك الحق، ولقاؤك الحق، والجنة حق، والنار حق، والساعة حق، اللهم: لك أسلمت، وبك آمنت، وعليك توكلت، وإليك خاصمت، وبك حاكمت، فاغفر لي: ما قدمت، وما أخرت، وأسررت، وأعلنت، وما أنت أعلم به مني، لا إله إلا أنت",
        transliteration:
            "Allahumma rabbana lakal-hamd, anta qayyimus-samawati wal-ard, wa lakal-hamd, anta rabbus-samawati wal-ard wa man fihinn, wa lakal-hamd, anta nurus-samawati wal-ard wa man fihinn, antal-haqq, wa qawluka haqq, wa wa'duka haqq, wa liqa'uka haqq, wal-jannatu haqq, wan-naru haqq, was-sa'atu haqq, Allahumma laka aslamt, wa bika amant, wa 'alayka tawakkalt, wa ilayka khasamt, wa bika hakamt, faghfir li ma qaddamt, wa ma akhkhart, wa ma asrart, wa ma a'lant, wa ma anta a'lamu bihi minni, la ilaha illa anta",
        translation:
            "O Allah, our Lord, praise be to You, You are the Sustainer of the heavens and the earth. Praise be to You, You are the Lord of the heavens and the earth and all within them. Praise be to You, You are the Light of the heavens and the earth and all within them. You are the Truth, Your word is the truth, Your promise is the truth, meeting You is the truth, Paradise is true, the Fire is true, the Hour is true. O Allah, to You I submit, in You I believe, upon You I rely, to You I turn in dispute, and by You I judge. So forgive me for what I have done and what I have left undone, what I have done secretly and openly, and what You know better than I. There is no god but You."),
    const PrayerEntity(
        id: 2,
        content:
            "اللهم إني أعوذ بك من العجز والكسل والجبن والهرم والبخل، وأعوذ بك من عذاب القبر، ومن فتنة المحيا والممات",
        transliteration:
            "Allahumma inni a'udhu bika minal-'ajzi wal-kasal, wal-jubni wal-haram, wal-bukhl, wa a'udhu bika min 'adhabil-qabr, wa min fitnatil-mahya wal-mamat",
        translation:
            "O Allah, I seek refuge in You from helplessness, laziness, cowardice, senility, and miserliness. And I seek refuge in You from the punishment of the grave, and from the trial of life and death."),
    const PrayerEntity(
        id: 3,
        content:
            "اللهم إني أعوذ بك من فتنة النار، وعذاب النار، وفتنة القبر، وعذاب القبر، ومن شر فتنة الغنى، ومن شر فتنة الفقر، وأعوذ بك من شر فتنة المسيح الدجال، اللهم اغسل خطاياي بماء الثلج والبرد، ونقِّ قلبي من الخطايا كما نقيت الثوب الأبيض من الدنس، وباعد بيني وبين خطاياي كما باعدت بين المشرق والمغرب، اللهم إني أعوذ بك من الكسل والهرم والمأثم والمغرم",
        transliteration:
            "Allahumma inni a'udhu bika min fitnatin-nar, wa 'adhabin-nar, wa fitnatil-qabr, wa 'adhabil-qabr, wa min sharri fitnatil-ghina, wa min sharri fitnatil-faqr, wa a'udhu bika min sharri fitnatil-masihid-dajjal. Allahummaghsil khatayaya bi ma'ith-thalji wal-barad, wa naqqi qalbi minal-khataya kama naqqaytath-thawbal-abyada minad-danas, wa ba'id bayni wa bayna khatayaya kama ba'adta baynal-mashriqi wal-maghrib. Allahumma inni a'udhu bika minal-kasali wal-harami wal-ma'thami wal-maghram",
        translation:
            "O Allah, I seek refuge in You from the trial of the Fire, the punishment of the Fire, the trial of the grave, the punishment of the grave, the evil of the trial of riches, and the evil of the trial of poverty. And I seek refuge in You from the evil of the trial of the False Messiah (al-Masih ad-Dajjal). O Allah, wash away my sins with the water of snow and hail, and cleanse my heart of sins as a white garment is cleansed of dirt, and put a great distance between me and my sins as You have put a great distance between the East and the West. O Allah, I seek refuge in You from laziness, senility, sin, and debt."),
    const PrayerEntity(
        id: 4,
        content:
            " أعوذ برضاك من سخطك، وبمعافاتك من عقوبتك، وأعوذ بك منك، لا أحصي ثناء عليك أنت كما أثنيت على نفسك",
        transliteration:
            "A'udhu biridaka min sakhatik, wa bimu'afatika min 'uqubatik, wa a'udhu bika mink, la uhsi thana'an 'alayk, anta kama athnayta 'ala nafsik",
        translation:
            "I seek refuge in Your pleasure from Your anger, and in Your forgiveness from Your punishment, and I seek refuge in You from You. I cannot praise You enough; You are as You have praised Yourself."),
    const PrayerEntity(
        id: 5,
        content:
            "اللهم إني أعوذ بك من علم لا ينفع، وقلب لا يخشع، ودعاء لا يُسمع، ونفس لا تشبع",
        transliteration:
            "Allahumma inni a'udhu bika min 'ilmin la yanfa', wa min qalbin la yakhsha', wa min du'ain la yusma', wa min nafsin la tashba'",
        translation:
            "O Allah, I seek refuge in You from knowledge that does not benefit, a heart that does not fear (You), a supplication that is not heard, and a soul that is not satisfied."),
    const PrayerEntity(
        id: 6,
        content:
            "اللهم رحمتك أرجو فلا تكلني إلى نفسي طرفة عين، وأصلح لي شأني كله لا إله إلا أنت",
        transliteration:
            "Allahumma rahmataka arju fala takilni ila nafsi tarfata 'ayn, wa aslih li sha'ni kullah, la ilaha illa anta",
        translation:
            "O Allah, it is Your mercy that I hope for, so do not leave me to myself even for the blink of an eye, and set right all of my affairs. There is no god but You."),
    const PrayerEntity(
        id: 7,
        content: "ربنا آتنا في الدنيا حسنة وفي الآخرة حسنة وقنا عذاب النار",
        transliteration:
            "Rabbana atina fid-dunya hasanatan wa fil-akhirati hasanatan wa qina 'adhaban-nar",
        translation:
            "Our Lord, give us good in this world and good in the Hereafter, and protect us from the punishment of the Fire."),
    const PrayerEntity(
        id: 8,
        content:
            "اللهم إني أسألك من الخير كله عاجله وآجله ما علمتُ منه وما لم أعلم، وأعوذ بك من الشر كله عاجله وآجله ما علمتُ منه وما لم أعلم، اللهم إني أسألك من خير ما سألك عبدك ونبيك، وأعوذ بك من شر ما عاذ به عبدك ونبيك، اللهم إني أسألك الجنة وما قرب إليها من قول أو عمل، وأعوذ بك من النار وما قرب إليها من قول أو عمل، وأسألك أن تجعل كل قضاء قضيته لي خيرا",
        transliteration:
            "Allahumma inni as'aluka minal-khayri kullihi, 'ajilihi wa ajilih, ma 'alimtu minhu wa ma lam a'lam, wa a'udhu bika minash-sharri kullihi, 'ajilihi wa ajilih, ma 'alimtu minhu wa ma lam a'lam. Allahumma inni as'aluka min khayri ma sa'alaka 'abduka wa nabiyyuk, wa a'udhu bika min sharri ma 'adha bihi 'abduka wa nabiyyuk. Allahumma inni as'alukal-jannata wa ma qarraba ilayha min qawlin aw 'amal, wa a'udhu bikan-nara wa ma qarraba ilayha min qawlin aw 'amal, wa as'aluka an tuj'ala kulla qada'in qadaytahu li khayra",
        translation:
            "O Allah, I ask You for all that is good, in this life and the next, what I know of it and what I do not know, and I seek refuge in You from all that is evil, in this life and the next, what I know of it and what I do not know. O Allah, I ask You for the good that Your servant and Prophet asked You for, and I seek refuge in You from the evil that Your servant and Prophet sought refuge from. O Allah, I ask You for Paradise and whatever word or deed brings me closer to it, and I seek refuge in You from the Fire and whatever word or deed brings me closer to it, and I ask that You make every decree You ordain for me good."),
    const PrayerEntity(
        id: 9,
        content:
            "اللهم بعلمك الغيب، وقدرتك على الخلق أحيني ما علمتَ الحياة خيراً لي، وتوفني إذا علمت الوفاة خيراً لي، اللهم وأسألك خشيتك في الغيب والشهادة، وأسألك كلمة الحق في الرضا والغضب، وأسألك القصد في الفقر والغنى، وأسألك نعيماً لا ينفد، وأسألك قرة عين لا تنقطع، وأسألك الرضاء بعد القضاء، وأسألك بَرْد العيش بعد الموت، وأسألك لذة النظر إلى وجهك والشوق إلى لقائك في غير ضراء مضرة، ولا فتنة مضلة، اللهم زينا بزينة الإيمان، واجعلنا هداة مهتدين",
        transliteration:
            "Allahumma bi'ilmikal-ghayba, wa qudratika 'alal-khalq, ahyini ma 'alimtal-hayata khayral-li, wa tawaffani idha 'alimtal-wafata khayral-li. Allahumma wa as'aluka khashyataka fil-ghaybi wash-shahadah, wa as'aluka kalimatal-haqqi fir-rida wal-ghadab, wa as'alukal-qasda fil-faqri wal-ghina, wa as'aluka na'iman la yanfad, wa as'aluka qurrata 'aynin la tanqati', wa as'alukar-rida ba'dal-qada, wa as'aluka barda-l'aysh ba'dal-mawt, wa as'aluka ladhdhatan-nazari ila wajhika wash-shawqa ila liqa'ika fi ghayri darra'a mudirratin wa la fitnatin mudillah. Allahumma zayyinna bi zinatil-imani, waj'alna hudatan muhtadin",
        translation:
            "O Allah, by Your knowledge of the unseen and Your power over creation, keep me alive as long as You know life is good for me, and take my life when You know death is better for me. O Allah, I ask You for the fear of You in private and in public, I ask You for the word of truth in contentment and in anger, I ask You for moderation in poverty and in wealth, I ask You for bliss that never ends, I ask You for the comfort of the eye that never fades, I ask You for satisfaction after the decree, I ask You for a cool life after death, and I ask You for the pleasure of looking at Your face and the longing to meet You, without any distressing adversity or misguiding trial. O Allah, adorn us with the ornament of faith, and make us guides who are rightly guided."),
    const PrayerEntity(
        id: 10,
        content:
            "اللَّهُمَّ إِنِّي أَسْأَلُكَ الْمُعَافَاةَ فِي الدُّنْيَا وَالْآخِرَةِ",
        transliteration:
            "Allahumma inni as'alukal-mu'afata fid-dunya wal-akhirah",
        translation:
            "O Allah, I ask You for well-being in this world and in the Hereafter."),
    const PrayerEntity(
        id: 11,
        content:
            "اللهم أنت ربي لا إله إلا أنت، خلقتني وأنا عبدك، وأنا على عهدك ووعدك ما استطعت، أعوذ بك من شر ما صنعت، أبوء لك بنعمتك علي، وأبوء لك بذنبي فاغفر لي، فإنه لا يغفر الذنوب إلا أنت",
        transliteration:
            "Allahumma anta rabbi la ilaha illa anta, khalaqtani wa ana 'abduk, wa ana 'ala 'ahdika wa wa'dika mastata't, a'udhu bika min sharri ma sana't, abu'u laka bini'matika 'alayya, wa abu'u laka bidhanbi faghfir li, fa'innahu la yaghfirudh-dhunuba illa anta",
        translation:
            "O Allah, You are my Lord, there is no god but You. You created me and I am Your servant, and I remain on Your covenant and promise as much as I am able. I seek refuge in You from the evil of what I have done. I acknowledge Your favor upon me, and I acknowledge my sin, so forgive me, for none forgives sins except You."),
    const PrayerEntity(
        id: 12,
        content:
            " {رَبَّنَا ءاتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ}[البقرة: 201]",
        transliteration:
            "Rabbana atina fid-dunya hasanatan wa fil-akhirati hasanatan wa qina 'adhaban-nar",
        translation:
            "Our Lord, give us good in this world and good in the Hereafter, and save us from the punishment of the Fire. [Al-Baqarah: 201]"),
    const PrayerEntity(
        id: 13,
        content:
            "{رَبَّنَا ظَلَمْنَا أَنفُسَنَا وَإِنْ لَمْ تَغْفِرْ لَنَا وَتَرْحَمْنَا لَنَكُونَنَّ مِنْ الْخَاسِرِينَ}[الأعراف: 23]",
        transliteration:
            "Rabbana zalamna anfusana wa in lam taghfir lana wa tarhamna lanakunanna minal-khasirin",
        translation:
            "Our Lord, we have wronged ourselves, and if You do not forgive us and have mercy upon us, we will surely be among the losers. [Al-A'raf: 23]"),
    const PrayerEntity(
        id: 14,
        content:
            " {رَبَّنَا لا تُؤَاخِذْنَا إِنْ نَسِينَا أَوْ أَخْطَأْنَا رَبَّنَا وَلا تَحْمِلْ عَلَيْنَا إِصْرًا كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِنْ قَبْلِنَا رَبَّنَا وَلا تُحَمِّلْنَا مَا لا طَاقَةَ لَنَا بِهِ وَاعْفُ عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَا أَنْتَ مَوْلانَا فَانصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ}[البقرة: 286]",
        transliteration:
            "Rabbana la tu'akhidhna in nasina aw akhta'na, Rabbana wa la tahmil 'alayna isran kama hamaltahu 'alal-ladhina min qablina, Rabbana wa la tuhammilna ma la taqata lana bih, wa'fu 'anna waghfir lana warhamna, anta mawlana fansurna 'alal-qawmil-kafirin",
        translation:
            "Our Lord, do not hold us accountable if we forget or make a mistake. Our Lord, do not lay upon us a burden like that which You laid upon those before us. Our Lord, do not burden us with more than we have the strength to bear. Pardon us, forgive us, and have mercy upon us. You are our protector, so grant us victory over the disbelieving people. [Al-Baqarah: 286]"),
    const PrayerEntity(
        id: 15,
        content:
            "{رَبَّنَا هَبْ لَنَا مِنْ أَزْوَاجِنَا وَذُرِّيَّاتِنَا قُرَّةَ أَعْيُنٍ وَاجْعَلْنَا لِلْمُتَّقِينَ إِمَامًا}[الفرقان: 74] ",
        transliteration:
            "Rabbana hab lana min azwajina wa dhurriyyatina qurrata a'yunin waj'alna lil-muttaqina imama",
        translation:
            "Our Lord, grant us from among our spouses and offspring comfort to our eyes, and make us an example for the righteous. [Al-Furqan: 74]"),
    const PrayerEntity(
        id: 16,
        content:
            "{رَبِّ اغْفِرْ لِي وَلِوَالِدَيَّ وَلِمَنْ دَخَلَ بَيْتِي مُؤْمِنًا وَلِلْمُؤْمِنِينَ وَالْمُؤْمِنَاتِ}[نوح: 28] ",
        transliteration:
            "Rabbighfir li wa liwalidayya wa liman dakhala baytiya mu'minan wa lil-mu'minina wal-mu'minat",
        translation:
            "My Lord, forgive me and my parents, and whoever enters my house as a believer, and the believing men and believing women. [Nuh: 28]"),
    const PrayerEntity(
        id: 17,
        content:
            " {رَبِّ إِنِّي لِمَا أَنزَلْتَ إِلَيَّ مِنْ خَيْرٍ فَقِيرٌ}[القصص: 24]",
        transliteration: "Rabbi inni lima anzalta ilayya min khayrin faqir",
        translation:
            "My Lord, indeed I am in need of whatever good You would send down to me. [Al-Qasas: 24]"),
    const PrayerEntity(
        id: 18,
        content:
            "{رَبَّنَا ءاتِنَا مِنْ لَدُنْكَ رَحْمَةً وَهَيِّئْ لَنَا مِنْ أَمْرِنَا رَشَدًا}[الكهف: 10] ",
        transliteration:
            "Rabbana atina min ladunka rahmatan wa hayyi' lana min amrina rashada",
        translation:
            "Our Lord, grant us mercy from Yourself and facilitate for us our affair in the right way. [Al-Kahf: 10]"),
    const PrayerEntity(
        id: 19,
        content:
            "{رَبِّ أَعُوذُ بِكَ مِنْ هَمَزَاتِ الشَّيَاطِينِ * وَأَعُوذُ بِكَ رَبِّ أَنْ يَحْضُرُونِ}[المؤمنون: 97-98] ",
        transliteration:
            "Rabbi a'udhu bika min hamazatish-shayatin, wa a'udhu bika rabbi an yahdurun",
        translation:
            "My Lord, I seek refuge in You from the incitements of the devils, and I seek refuge in You, my Lord, lest they be present with me. [Al-Mu'minun: 97-98]"),
    const PrayerEntity(
        id: 20,
        content:
            "{رَبَّنَا أَتْمِمْ لَنَا نُورَنَا وَاغْفِرْ لَنَا إِنَّكَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ}[التحريم: 8] ",
        transliteration:
            "Rabbana atmim lana nurana waghfir lana innaka 'ala kulli shay'in qadir",
        translation:
            "Our Lord, perfect for us our light and forgive us. Indeed, You are over all things competent. [At-Tahrim: 8]"),
    const PrayerEntity(
        id: 21,
        content:
            "{رَبَّنَا إِنَّنَا آمَنَّا فَاغْفِرْ لَنَا ذُنُوبَنَا وَقِنَا عَذَابَ النَّارِ}[آل عمران: 16] ",
        transliteration:
            "Rabbana innana amanna faghfir lana dhunubana wa qina 'adhaban-nar",
        translation:
            "Our Lord, we have believed, so forgive us our sins and protect us from the punishment of the Fire. [Al 'Imran: 16]"),
    const PrayerEntity(
        id: 22,
        content:
            "{رَبِّ هَبْ لِي مِنْ لَدُنْكَ ذُرِّيَّةً طَيِّبَةً إِنَّكَ سَمِيعُ الدُّعَاءِ}[آل عمران: 38] ",
        transliteration:
            "Rabbi hab li min ladunka dhurriyyatan tayyibatan innaka sami'ud-du'a",
        translation:
            "My Lord, grant me from Yourself righteous offspring. Indeed, You are the Hearer of supplication. [Al 'Imran: 38]"),
    const PrayerEntity(
        id: 23,
        content:
            "اللهم إني ظلمت نفسي ظلما كثيرا ولا يغفر الذنوب إلا أنت، فاغفر لي مغفرة من عندك وارحمني، إنك أنت الغفور الرحيم",
        transliteration:
            "Allahumma inni zalamtu nafsi zulman kathiran, wa la yaghfirudh-dhunuba illa anta, faghfir li maghfiratan min 'indika warhamni, innaka antal-ghafurur-rahim",
        translation:
            "O Allah, I have wronged myself greatly, and none forgives sins except You. So forgive me with a forgiveness from You, and have mercy on me. Indeed, You are the Forgiving, the Merciful."),
    const PrayerEntity(
        id: 24,
        content:
            "{رَبِّ أَوْزِعْنِي أَنْ أَشْكُرَ نِعْمَتَكَ الَّتِي أَنْعَمْتَ عَلَيَّ وَعَلَى وَالِدَيَّ وَأَنْ أَعْمَلَ صَالِحًا تَرْضَاهُ وَأَدْخِلْنِي بِرَحْمَتِكَ فِي عِبَادِكَ الصَّالِحِينَ}[النمل: 19]",
        transliteration:
            "Rabbi awzi'ni an ashkura ni'mataka-llati an'amta 'alayya wa 'ala walidayya wa an a'mala salihan tardahu wa adkhilni birahmatika fi 'ibadikas-salihin",
        translation:
            "My Lord, enable me to be grateful for Your favor which You have bestowed upon me and upon my parents, and to do righteous deeds that please You, and admit me by Your mercy into the ranks of Your righteous servants. [An-Naml: 19]"),
    const PrayerEntity(
        id: 25,
        content:
            "اللهم صل على محمد وعلى آل محمد، كما صليت على إبراهيم، وعلى آل إبراهيم، إنك حميد مجيد، اللهم بارك على محمد وعلى آل محمد، كما باركت على إبراهيم وعلى آل إبراهيم، إنك حميد مجيد",
        transliteration:
            "Allahumma salli 'ala Muhammadin wa 'ala ali Muhammad, kama sallayta 'ala Ibrahima wa 'ala ali Ibrahim, innaka hamidun majid. Allahumma barik 'ala Muhammadin wa 'ala ali Muhammad, kama barakta 'ala Ibrahima wa 'ala ali Ibrahim, innaka hamidun majid",
        translation:
            "O Allah, send prayers upon Muhammad and the family of Muhammad, as You sent prayers upon Ibrahim and the family of Ibrahim. Indeed, You are Praiseworthy and Glorious. O Allah, send blessings upon Muhammad and the family of Muhammad, as You sent blessings upon Ibrahim and the family of Ibrahim. Indeed, You are Praiseworthy and Glorious."),
    const PrayerEntity(
        id: 26,
        content:
            "اللهم إني أعوذ بك من الهم والحزن، والعجز والكسل، والجبن والبخل، وضلع الدين، وغلبة الرجال",
        transliteration:
            "Allahumma inni a'udhu bika minal-hammi wal-hazan, wal-'ajzi wal-kasal, wal-jubni wal-bukhl, wa dala'id-dayni wa ghalabatir-rijal",
        translation:
            "O Allah, I seek refuge in You from worry and grief, from helplessness and laziness, from cowardice and miserliness, from being overcome by debt and overpowered by men."),
    const PrayerEntity(
        id: 27,
        content:
            "اللهم إني أعوذ بك من زوال نعمتك، وتحول عافيتك وفجاءة نقمتك، وجميع سخطك",
        transliteration:
            "Allahumma inni a'udhu bika min zawali ni'matik, wa tahawwuli 'afiyatik, wa fuja'ati niqmatik, wa jami'i sakhatik",
        translation:
            "O Allah, I seek refuge in You from the decline of Your blessing, the turning away of the well-being You have granted, Your sudden punishment, and all that displeases You."),
    const PrayerEntity(
        id: 28,
        content: "اللهم إني أعوذ بك من البرص والجنون والجذام ومن سيئ الأسقام",
        transliteration:
            "Allahumma inni a'udhu bika minal-barasi wal-jununi wal-judham, wa min sayyi'il-asqam",
        translation:
            "O Allah, I seek refuge in You from leprosy, insanity, elephantiasis, and evil diseases."),
    const PrayerEntity(
        id: 29,
        content: "اللهم إني أعوذ بك من منكرات الأخلاق والأعمال والأهواء",
        transliteration:
            "Allahumma inni a'udhu bika min munkaratil-akhlaqi wal-a'mali wal-ahwa'",
        translation:
            "O Allah, I seek refuge in You from bad character, deeds, and desires."),
    const PrayerEntity(
        id: 30,
        content:
            "اللهم إني أعوذ بك من الهدم وأعوذ بك من التردي وأعوذ بك من الغرق والحرق والهرم وأعوذ بك أن يتخبطني الشيطان عند الموت وأعوذ بك أن أموت في سبيلك مدبرا وأعوذ بك أن أموت لديغا",
        transliteration:
            "Allahumma inni a'udhu bika minal-hadmi, wa a'udhu bika minat-taraddi, wa a'udhu bika minal-gharaqi wal-harqi wal-haram, wa a'udhu bika an yatakhabbatanish-shaytanu 'indal-mawt, wa a'udhu bika an amuta fi sabilika mudabbiran, wa a'udhu bika an amuta ladigha",
        translation:
            "O Allah, I seek refuge in You from being crushed by a falling structure, and I seek refuge in You from falling from a height, and I seek refuge in You from drowning, burning, and senility, and I seek refuge in You from being touched by Satan at the time of death, and I seek refuge in You from dying while fleeing in Your cause, and I seek refuge in You from dying from a sting or bite."),
    const PrayerEntity(
        id: 31,
        content:
            "اللهم إني أسألك يا الله بأنك الواحد الأحد الصمد الذي لم يلد ولم يولد ولم يكن له كفوا أحد أن تغفر لي ذنوبي إنك أنت الغفور الرحيم",
        transliteration:
            "Allahumma inni as'aluka ya Allahu bi'annakal-wahidul-ahadus-samad, alladhi lam yalid wa lam yulad, wa lam yakun lahu kufuwan ahad, an taghfira li dhunubi, innaka antal-ghafurur-rahim",
        translation:
            "O Allah, I ask You, O Allah, the One, the Unique, the Self-Sufficient Master, Who was not born and does not give birth, and Who has no equal, to forgive my sins. Indeed, You are the Forgiving, the Merciful."),
    const PrayerEntity(
        id: 32,
        content: "اللهم إني أسألك الهدى والتقى والعفاف والغنى",
        transliteration:
            "Allahumma inni as'alukal-huda wat-tuqa wal-'afafa wal-ghina",
        translation:
            "O Allah, I ask You for guidance, piety, chastity, and contentment."),
    const PrayerEntity(
        id: 33,
        content: "اللهم أعني على ذكرك وشكرك وحسن عبادتك",
        transliteration:
            "Allahumma a'inni 'ala dhikrika wa shukrika wa husni 'ibadatik",
        translation:
            "O Allah, help me to remember You, thank You, and worship You in the best way."),
    const PrayerEntity(
        id: 34,
        content:
            "اللهم اغفر لي خطيئتي، وجهلي وإسرافي، في أمري وما أنت أعلم به مني، اللهم اغفر لي جدي وهزلي وخطئي وعمدي وكل ذلك عندي، اللهم اغفر لي ما قدمت وما أخرت وما أسررت وما أعلنت وما أنت أعلم به مني أنت المقدم وأنت المؤخر، وأنت على كل شيء قدير",
        transliteration:
            "Allahummaghfir li khati'ati wa jahli wa israfi fi amri, wa ma anta a'lamu bihi minni. Allahummaghfir li jiddi wa hazli wa khati'i wa 'amdi, wa kullu dhalika 'indi. Allahummaghfir li ma qaddamtu wa ma akhkhartu wa ma asrartu wa ma a'lantu, wa ma anta a'lamu bihi minni, anta-l-muqaddimu wa anta-l-mu'akhkhiru, wa anta 'ala kulli shay'in qadir",
        translation:
            "O Allah, forgive me my errors, my ignorance, and my excess in my affairs, and what You know better than I. O Allah, forgive me my seriousness and my jesting, my errors and my intentional acts — all of these are within me. O Allah, forgive me what I have done before and what I have left, what I have done secretly and openly, and what You know better than I. You are the One who brings forward and puts back, and You are able to do all things."),
    const PrayerEntity(
        id: 35,
        content:
            "اللهم حبب إلينا الإيمان وزينه في قلوبنا، وكره إلينا الكفر والفسوق والعصيان، واجعلنا من الراشدين، اللهم توفنا مسلمين وأحينا مسلمين وألحقنا بالصالحين غير خزايا ولا مفتونين",
        transliteration:
            "Allahumma habbib ilaynal-imana wa zayyinhu fi qulubina, wa karrih ilaynal-kufra wal-fusuqa wal-'isyan, waj'alna minar-rashidin. Allahumma tawaffana muslimina wa ahyina muslimina wa alhiqna bis-salihina ghayra khazaya wa la maftunin",
        translation:
            "O Allah, make faith beloved to us and beautify it in our hearts, and make disbelief, wickedness, and disobedience detestable to us, and make us of those who are rightly guided. O Allah, let us die as Muslims and live as Muslims, and join us with the righteous, not disgraced nor tried by trials."),
    const PrayerEntity(
        id: 36,
        content: "اللهم اغفر لي ذنبي كله، دقه وجله، وأوله وآخره، وعلانيته وسره",
        transliteration:
            "Allahummaghfir li dhanbi kullah, diqqahu wa jillahu, wa awwalahu wa akhirahu, wa 'alaniyatahu wa sirrahu",
        translation:
            "O Allah, forgive me all of my sins, the small and the great, the first and the last, the open and the secret."),
    const PrayerEntity(
        id: 37,
        content:
            "اللهم ربنا آتنا في الدنيا حسنة، وفي الآخرة حسنة، وقنا عذاب النار",
        transliteration:
            "Allahumma rabbana atina fid-dunya hasanatan wa fil-akhirati hasanatan wa qina 'adhaban-nar",
        translation:
            "O Allah, our Lord, give us good in this world and good in the Hereafter, and protect us from the punishment of the Fire."),
    const PrayerEntity(
        id: 38,
        content: "يا مقلب القلوب ثبت قلبي على دينك",
        transliteration: "Ya muqallibal-qulub, thabbit qalbi 'ala dinik",
        translation:
            "O Turner of hearts, make my heart firm upon Your religion."),
    const PrayerEntity(
        id: 39,
        content: "اللهم أحسنت خَلقي فأحسن خُلقي",
        transliteration: "Allahumma ahsanta khalqi fa-ahsin khuluqi",
        translation:
            "O Allah, You have made my physical form good, so make my character good too."),
    const PrayerEntity(
        id: 40,
        content:
            "اللهم أعوذ برضاك من سخطك، وبمعافاتك من عقوبتك، وأعوذ بك منك، لا أحصي ثناء عليك، أنت كما أثنيت على نفسك",
        transliteration:
            "Allahumma a'udhu biridaka min sakhatik, wa bimu'afatika min 'uqubatik, wa a'udhu bika mink, la uhsi thana'an 'alayk, anta kama athnayta 'ala nafsik",
        translation:
            "O Allah, I seek refuge in Your pleasure from Your anger, and in Your forgiveness from Your punishment, and I seek refuge in You from You. I cannot praise You enough; You are as You have praised Yourself."),
    const PrayerEntity(
        id: 41,
        content:
            "اللهم اغفر لي ما قدمت وما أخرت، وما أسررت وما أعلنت، وما أسرفت، وما أنت أعلم به مني، أنت المقدم وأنت المؤخر، لا إله إلا أنت",
        transliteration:
            "Allahummaghfir li ma qaddamtu wa ma akhkhart, wa ma asrartu wa ma a'lant, wa ma asraft, wa ma anta a'lamu bihi minni, antal-muqaddimu wa antal-mu'akhkhir, la ilaha illa anta",
        translation:
            "O Allah, forgive me what I have done and what I have left, what I have done secretly and openly, and my excesses, and what You know better than I. You are the One who brings forward and puts back. There is no god but You."),
    const PrayerEntity(
        id: 42,
        content:
            "اللهم اهدني فيمن هديت، وعافني فيمن عافيت، وتولني فيمن توليت، وبارك لي فيما أعطيت وقني شر ما قضيت، إنك تقضي ولا يقضى عليك، وإنه لا يذل من واليت ولا يعز من عاديت تباركت ربنا وتعاليت",
        transliteration:
            "Allahummahdini fiman hadayt, wa 'afini fiman 'afayt, wa tawallani fiman tawallayt, wa barik li fima a'tayt, wa qini sharra ma qadayt, innaka taqdi wa la yuqda 'alayk, wa innahu la yadhillu man walayta wa la ya'izzu man 'adayt, tabarakta rabbana wa ta'alayt",
        translation:
            "O Allah, guide me among those You have guided, grant me safety among those You have granted safety, take care of me among those You have taken care of, bless what You have given me, and protect me from the evil You have decreed. Indeed, You decree and none can decree over You. He whom You have befriended is not humiliated, and he whom You have made an enemy is not honored. Blessed are You, our Lord, and Exalted."),
    const PrayerEntity(
        id: 43,
        content: "أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ",
        transliteration: "Alā bidhikrillāhi taṭma'innul-qulūb.",
        translation: "Verily, in the remembrance of Allah do hearts find rest.",
        reference: "الرعد ٢٨"),
  ];

  static List<ZikrCategory> categories = [
    const ZikrCategory(
      key: 'morning',
      title: 'أذكار الصباح',
      titleEn: 'Morning Adhkar',
      icon: Icons.wb_sunny_outlined,
      color: morningOrange,
      isTrackedDaily: true,
    ),
    const ZikrCategory(
      key: 'evening',
      title: 'أذكار المساء',
      titleEn: 'Evening Adhkar',
      icon: Icons.nightlight_round,
      color: eveningPurple,
      isTrackedDaily: true,
    ),
    const ZikrCategory(
      key: 'sleep',
      title: 'أذكار النوم',
      titleEn: 'Sleep',
      icon: Icons.bedtime_outlined,
      color: categorySleepBlue,
      isTrackedDaily: true,
    ),
    const ZikrCategory(
      key: 'wakingUp',
      title: 'عند الاستيقاظ',
      titleEn: 'Waking Up',
      icon: Icons.alarm_outlined,
      color: categoryAlarmAmber,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'newClothes',
      title: 'لبس ثوب جديد',
      titleEn: 'New Clothes',
      icon: Icons.checkroom_outlined,
      color: categoryClothesTeal,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'leavingHome',
      title: 'الخروج من البيت',
      titleEn: 'Leaving Home',
      icon: Icons.logout_outlined,
      color: categoryDoorBrown,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'enteringBathroom',
      title: 'دخول دورة المياة',
      titleEn: 'Entering the Bathroom',
      icon: Icons.wc_outlined,
      color: categoryBathroomCyan,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'leavingBathroom',
      title: 'الخروج من دورة المياة',
      titleEn: 'Leaving the Bathroom',
      icon: Icons.wc_outlined,
      color: categoryBathroomCyan,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'enteringMosque',
      title: 'دخول المسجد',
      titleEn: 'Entering the Mosque',
      icon: Icons.mosque_outlined,
      color: categoryMosqueGreen,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'leavingMosque',
      title: 'الخروج من المسجد',
      titleEn: 'Leaving the Mosque',
      icon: Icons.exit_to_app_outlined,
      color: categoryMosqueGreen,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'hearingAdhan',
      title: 'سماع الأذان',
      titleEn: 'Hearing the Adhan',
      icon: Icons.volume_up_outlined,
      color: categoryAdhanIndigo,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'afterAdhan',
      title: 'بعد سماع الأذان',
      titleEn: 'After the Adhan',
      icon: Icons.campaign_outlined,
      color: categoryAdhanIndigo,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'distress',
      title: 'عند الكرب',
      titleEn: 'At Distress',
      icon: Icons.sos_outlined,
      color: categoryDistressRed,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'sadness',
      title: 'عند الهَمّ أو الحزن',
      titleEn: 'Sadness or Grief',
      icon: Icons.sentiment_dissatisfied_outlined,
      color: categorySadnessSlate,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'fearOfPeople',
      title: 'عند الخوف من قوم',
      titleEn: 'Fear of People',
      icon: Icons.visibility_off_outlined,
      color: categoryFearViolet,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'meetingEnemy',
      title: 'عند لقاء العدو',
      titleEn: 'Meeting an Enemy',
      icon: Icons.gpp_maybe_outlined,
      color: categoryEnemyMaroon,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'overwhelmed',
      title: 'إذا غلبك أمر',
      titleEn: 'When Overwhelmed',
      icon: Icons.bolt_outlined,
      color: categoryOverwhelmedYellow,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'afterSin',
      title: 'عند فعل ذنب',
      titleEn: 'After a Sin',
      icon: Icons.undo_outlined,
      color: categorySinGray,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'unpaidDebt',
      title: 'من عليه دين عجز عنه',
      titleEn: 'Unpaid Debt',
      icon: Icons.payments_outlined,
      color: categoryDebtOlive,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'anger',
      title: 'عند الغضب',
      titleEn: 'Anger',
      icon: Icons.mood_bad_outlined,
      color: categoryAngerCrimson,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'leavingGathering',
      title: 'عند القيام من المجلس',
      titleEn: 'Leaving a Gathering',
      icon: Icons.groups_outlined,
      color: categoryGatheringPlum,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'seeingAfflicted',
      title: 'إذا رأى مبتلى بمرض أو غيره',
      titleEn: 'Seeing the Afflicted',
      icon: Icons.healing_outlined,
      color: categoryAfflictedPink,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'seeingSomethingPleasing',
      title: 'عند رؤية ما يعجبك',
      titleEn: 'Seeing Something Pleasing',
      icon: Icons.favorite_outline,
      color: categoryPleasingRose,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'leavingHomeDua',
      title: 'دعاء الخروج من المنزل',
      titleEn: 'Leaving the House',
      icon: Icons.door_front_door_outlined,
      color: categoryDoorBrown,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'travel',
      title: 'دعـاء السفـر',
      titleEn: 'Travel',
      icon: Icons.flight_outlined,
      color: categoryTravelSky,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'ridingMount',
      title: 'دعاء ركوب الدابة',
      titleEn: 'Riding a Mount',
      icon: Icons.pets_outlined,
      color: categoryMountBrown,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'visitingGraves',
      title: 'دعاء زيارة القبور',
      titleEn: 'Visiting Graves',
      icon: Icons.park_outlined,
      color: categoryGravesGreen,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'afterPrayer',
      title: 'أذكار بعد الصلاة',
      titleEn: 'After-Prayer Adhkar',
      icon: Icons.flag_outlined,
      color: categoryAfterPrayerGreen,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'ruqyah',
      title: 'الرقية',
      titleEn: 'Ruqyah',
      icon: Icons.shield_outlined,
      color: categoryRuqyahTeal,
      isTrackedDaily: false,
    ),
    const ZikrCategory(
      key: 'afterEating',
      title: 'بعد الأكل',
      titleEn: 'After Eating',
      icon: Icons.restaurant_outlined,
      color: categoryEatingOrange,
      isTrackedDaily: false,
    ),
  ];
}
