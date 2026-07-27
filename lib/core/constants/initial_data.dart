import 'package:bank_el_ziker/features/adhkar/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/home/domain/entities/prayer.dart';

class InitialData {
  static List<ZikrEntity> generalAzkar = [
    const ZikrEntity(
        id: 1,
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
        category: 'general',
        content: "لا إله إلا الله",
        contentTransliteration: "La ilaha illa Allah",
        contentEn: "There is no god but Allah",
        descriptionEn:
            "The Prophet ﷺ said: Allah has forbidden the Fire for whoever says \"There is no god but Allah\", seeking thereby the Face of Allah. (Bukhari)",
        description:
            "قال رسول الله ﷺ: (فإنَّ اللَّهَ قدْ حَرَّمَ علَى النَّارِ مَن قالَ: لا إلَهَ إلَّا اللَّهُ، يَبْتَغِي بذلكَ وجْهَ اللَّهِ). رواه البخاري"),
    const ZikrEntity(
        id: 4,
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
        category: 'general',
        content: "سبحان الله وبحمده، سبحان الله العظيم",
        contentTransliteration: "Subhan Allahi wa bihamdih, Subhan Allahil azim",
        contentEn:
            "Glory be to Allah and praise Him, glory be to Allah the Almighty",
        descriptionEn:
            "The Prophet ﷺ said: Two phrases that are light on the tongue, heavy on the scale, and beloved to the Most Merciful: \"Glory be to Allah and praise Him, glory be to Allah the Almighty.\" (Bukhari)",
        description:
            "قال النبي ﷺ: (كَلِمَتانِ خَفِيفَتانِ علَى اللِّسانِ، ثَقِيلَتانِ في المِيزانِ، حَبِيبَتانِ إلى الرَّحْمَنِ، سُبْحانَ اللَّهِ وبِحَمْدِهِ، سُبْحانَ اللَّهِ العَظِيمِ). رواه البخاري"),
    const ZikrEntity(
        id: 13,
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
        category: 'morning',
        content:
            """أَصْـبَحْنا وَأَصْـبَحَ المُـلْكُ لله وَالحَمدُ لله ، لا إلهَ إلاّ اللّهُ وَحدَهُ لا شَريكَ لهُ، لهُ المُـلكُ ولهُ الحَمْـد، وهُوَ على كلّ شَيءٍ قدير ، رَبِّ أسْـأَلُـكَ خَـيرَ ما في هـذا اليوم وَخَـيرَ ما بَعْـدَه ، وَأَعـوذُ بِكَ مِنْ شَـرِّ ما في هـذا اليوم وَشَرِّ ما بَعْـدَه، رَبِّ أَعـوذُبِكَ مِنَ الْكَسَـلِ وَسـوءِ الْكِـبَر ، رَبِّ أَعـوذُ بِكَ مِنْ عَـذابٍ في النّـارِ وَعَـذابٍ في القَـبْر.""",
        count: 1),
    const ZikrEntity(
        id: 6,
        category: 'morning',
        content:
            """اللّهـمَّ أَنْتَ رَبِّـي لا إلهَ إلاّ أَنْتَ ، خَلَقْتَنـي وَأَنا عَبْـدُك ، وَأَنا عَلـى عَهْـدِكَ وَوَعْـدِكَ ما اسْتَـطَعْـت ، أَعـوذُبِكَ مِنْ شَـرِّ ما صَنَـعْت ، أَبـوءُ لَـكَ بِنِعْـمَتِـكَ عَلَـيَّ وَأَبـوءُ بِذَنْـبي فَاغْفـِرْ لي فَإِنَّـهُ لا يَغْـفِرُ الذُّنـوبَ إِلاّ أَنْتَ """,
        count: 1),
    const ZikrEntity(
        id: 7,
        category: 'morning',
        content:
            """رَضيـتُ بِاللهِ رَبَّـاً وَبِالإسْلامِ ديـناً وَبِمُحَـمَّدٍ صلى الله عليه وسلم نَبِيّـاً.""",
        count: 3),
    const ZikrEntity(
        id: 8,
        category: 'morning',
        content:
            """اللّهُـمَّ إِنِّـي أَصْبَـحْتُ أُشْـهِدُك ، وَأُشْـهِدُ حَمَلَـةَ عَـرْشِـك ، وَمَلَائِكَتَكَ ، وَجَمـيعَ خَلْـقِك ، أَنَّـكَ أَنْـتَ اللهُ لا إلهَ إلاّ أَنْـتَ وَحْـدَكَ لا شَريكَ لَـك ، وَأَنَّ ُ مُحَمّـداً عَبْـدُكَ وَرَسـولُـك.""",
        count: 4),
    const ZikrEntity(
        id: 9,
        category: 'morning',
        content:
            """اللّهُـمَّ ما أَصْبَـَحَ بي مِـنْ نِعْـمَةٍ أَو بِأَحَـدٍ مِـنْ خَلْـقِك ، فَمِـنْكَ وَحْـدَكَ لا شريكَ لَـك ، فَلَـكَ الْحَمْـدُ وَلَـكَ الشُّكْـر.""",
        count: 1),
    const ZikrEntity(
        id: 10,
        category: 'morning',
        content: """
حَسْبِـيَ اللّهُ لا إلهَ إلاّ هُوَ عَلَـيهِ تَوَكَّـلتُ وَهُوَ رَبُّ العَرْشِ العَظـيم. """,
        count: 7),
    const ZikrEntity(
        id: 11,
        category: 'morning',
        content:
            """بِسـمِ اللهِ الذي لا يَضُـرُّ مَعَ اسمِـهِ شَيءٌ في الأرْضِ وَلا في السّمـاءِ وَهـوَ السّمـيعُ العَلـيم.""",
        count: 3,
        description: "لم يضره من الله شيء."),
    const ZikrEntity(
        id: 12,
        category: 'morning',
        content:
            """اللّهُـمَّ بِكَ أَصْـبَحْنا وَبِكَ أَمْسَـينا ، وَبِكَ نَحْـيا وَبِكَ نَمُـوتُ وَإِلَـيْكَ النُّـشُور. """,
        count: 1),
    const ZikrEntity(
        id: 13,
        category: 'morning',
        content:
            """أَصْبَـحْـنا عَلَى فِطْرَةِ الإسْلاَمِ، وَعَلَى كَلِمَةِ الإِخْلاَصِ، وَعَلَى دِينِ نَبِيِّنَا مُحَمَّدٍ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ، وَعَلَى مِلَّةِ أَبِينَا إبْرَاهِيمَ حَنِيفاً مُسْلِماً وَمَا كَانَ مِنَ المُشْرِكِينَ. """,
        count: 1),
    const ZikrEntity(
        id: 14,
        category: 'morning',
        content:
            """سُبْحـانَ اللهِ وَبِحَمْـدِهِ عَدَدَ خَلْـقِه ، وَرِضـا نَفْسِـه ، وَزِنَـةَ عَـرْشِـه ، وَمِـدادَ كَلِمـاتِـه.  """,
        count: 3),
    const ZikrEntity(
        id: 15,
        category: 'morning',
        content:
            """اللّهُـمَّ عافِـني في بَدَنـي ، اللّهُـمَّ عافِـني في سَمْـعي ، اللّهُـمَّ عافِـني في بَصَـري ، لا إلهَ إلاّ أَنْـتَ.  """,
        count: 3),
    const ZikrEntity(
        id: 16,
        category: 'morning',
        content:
            """اللّهُـمَّ إِنّـي أَعـوذُ بِكَ مِنَ الْكُـفر ، وَالفَـقْر ، وَأَعـوذُ بِكَ مِنْ عَذابِ القَـبْر ، لا إلهَ إلاّ أَنْـتَ.""",
        count: 3),
    const ZikrEntity(
        id: 17,
        category: 'morning',
        content:
            """اللّهُـمَّ إِنِّـي أسْـأَلُـكَ العَـفْوَ وَالعـافِـيةَ في الدُّنْـيا وَالآخِـرَة ، اللّهُـمَّ إِنِّـي أسْـأَلُـكَ العَـفْوَ وَالعـافِـيةَ في ديني وَدُنْـيايَ وَأهْـلي وَمالـي ، اللّهُـمَّ اسْتُـرْ عـوْراتي وَآمِـنْ رَوْعاتـي ، اللّهُـمَّ احْفَظْـني مِن بَـينِ يَدَيَّ وَمِن خَلْفـي وَعَن يَمـيني وَعَن شِمـالي ، وَمِن فَوْقـي ، وَأَعـوذُ بِعَظَمَـتِكَ أَن أُغْـتالَ مِن تَحْتـي.""",
        count: 1),
    const ZikrEntity(
        id: 18,
        category: 'morning',
        content:
            """يَا حَيُّ يَا قيُّومُ بِرَحْمَتِكَ أسْتَغِيثُ أصْلِحْ لِي شَأنِي كُلَّهُ وَلاَ تَكِلْنِي إلَى نَفْسِي طَـرْفَةَ عَيْنٍ. """,
        count: 3),
    const ZikrEntity(
        id: 19,
        category: 'morning',
        content:
            """أَصْبَـحْـنا وَأَصْبَـحْ المُـلكُ للهِ رَبِّ العـالَمـين ، اللّهُـمَّ إِنِّـي أسْـأَلُـكَ خَـيْرَ هـذا الـيَوْم ، فَـتْحَهُ ، وَنَصْـرَهُ ، وَنـورَهُ وَبَـرَكَتَـهُ ، وَهُـداهُ ، وَأَعـوذُ بِـكَ مِـنْ شَـرِّ ما فـيهِ وَشَـرِّ ما بَعْـدَه. """,
        count: 1),
    const ZikrEntity(
        id: 20,
        category: 'morning',
        content:
            """اللّهُـمَّ عالِـمَ الغَـيْبِ وَالشّـهادَةِ فاطِـرَ السّماواتِ وَالأرْضِ رَبَّ كـلِّ شَـيءٍ وَمَليـكَه ، أَشْهَـدُ أَنْ لا إِلـهَ إِلاّ أَنْت ، أَعـوذُ بِكَ مِن شَـرِّ نَفْسـي وَمِن شَـرِّ الشَّيْـطانِ وَشِرْكِهِ ، وَأَنْ أَقْتَـرِفَ عَلـى نَفْسـي سوءاً أَوْ أَجُـرَّهُ إِلـى مُسْـلِم. """,
        count: 1),
    const ZikrEntity(
        id: 21,
        category: 'morning',
        content:
            """أَعـوذُ بِكَلِمـاتِ اللّهِ التّـامّـاتِ مِنْ شَـرِّ ما خَلَـق. """,
        count: 3),
    const ZikrEntity(
        id: 22,
        category: 'morning',
        content:
            """اللَّهُمَّ صَلِّ وَسَلِّمْ وَبَارِكْ على نَبِيِّنَا مُحمَّد. """,
        count: 10),
    const ZikrEntity(
        id: 23,
        category: 'morning',
        content:
            """اللَّهُمَّ إِنَّا نَعُوذُ بِكَ مِنْ أَنْ نُشْرِكَ بِكَ شَيْئًا نَعْلَمُهُ ، وَنَسْتَغْفِرُكَ لِمَا لَا نَعْلَمُهُ. """,
        count: 3),
    const ZikrEntity(
        id: 24,
        category: 'morning',
        content:
            """اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ الْهَمِّ وَالْحَزَنِ، وَأَعُوذُ بِكَ مِنْ الْعَجْزِ وَالْكَسَلِ، وَأَعُوذُ بِكَ مِنْ الْجُبْنِ وَالْبُخْلِ، وَأَعُوذُ بِكَ مِنْ غَلَبَةِ الدَّيْنِ، وَقَهْرِ الرِّجَالِ.  """,
        count: 3),
    const ZikrEntity(
        id: 25,
        category: 'morning',
        content:
            """أسْتَغْفِرُ اللهَ العَظِيمَ الَّذِي لاَ إلَهَ إلاَّ هُوَ، الحَيُّ القَيُّومُ، وَأتُوبُ إلَيهِ.  """,
        count: 3),
    const ZikrEntity(
        id: 26,
        category: 'morning',
        content:
            """يَا رَبِّ , لَكَ الْحَمْدُ كَمَا يَنْبَغِي لِجَلَالِ وَجْهِكَ , وَلِعَظِيمِ سُلْطَانِكَ. """,
        count: 3),
    const ZikrEntity(
        id: 27,
        category: 'morning',
        content:
            """اللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا، وَرِزْقًا طَيِّبًا، وَعَمَلًا مُتَقَبَّلًا. """,
        count: 1),
    const ZikrEntity(
        id: 28,
        category: 'morning',
        content:
            """اللَّهُمَّ أَنْتَ رَبِّي لا إِلَهَ إِلا أَنْتَ ، عَلَيْكَ تَوَكَّلْتُ ، وَأَنْتَ رَبُّ الْعَرْشِ الْعَظِيمِ , مَا شَاءَ اللَّهُ كَانَ ، وَمَا لَمْ يَشَأْ لَمْ يَكُنْ ، وَلا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ الْعَلِيِّ الْعَظِيمِ , أَعْلَمُ أَنَّ اللَّهَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ ، وَأَنَّ اللَّهَ قَدْ أَحَاطَ بِكُلِّ شَيْءٍ عِلْمًا , اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ شَرِّ نَفْسِي ، وَمِنْ شَرِّ كُلِّ دَابَّةٍ أَنْتَ آخِذٌ بِنَاصِيَتِهَا ، إِنَّ رَبِّي عَلَى صِرَاطٍ مُسْتَقِيمٍ.  """,
        count: 1),
    const ZikrEntity(
        id: 29,
        category: 'morning',
        content:
            """لَا إلَه إلّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءِ قَدِيرِ. """,
        count: 100),
    const ZikrEntity(
        id: 30,
        category: 'morning',
        content: """سُبْحـانَ اللهِ وَبِحَمْـدِهِ. """,
        count: 100),
    const ZikrEntity(
        id: 31,
        category: 'morning',
        content: """أسْتَغْفِرُ اللهَ وَأتُوبُ إلَيْهِ""",
        count: 100),
  ];

  static List<ZikrEntity> nightAzkar = [
    const ZikrEntity(
        id: 1,
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
        category: 'evening',
        title: 'آخر سورة البقرة',
        content: """أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ
{آمَنَ الرَّسُولُ بِمَا أُنْزِلَ إِلَيْهِ مِنْ رَبِّهِ وَالْمُؤْمِنُونَ ۚ كُلٌّ آمَنَ بِاللَّهِ وَمَلَائِكَتِهِ وَكُتُبِهِ وَرُسُلِهِ لَا نُفَرِّقُ بَيْنَ أَحَدٍ مِنْ رُسُلِهِ ۚ وَقَالُوا سَمِعْنَا وَأَطَعْنَا ۖ غُفْرَانَكَ رَبَّنَا وَإِلَيْكَ الْمَصِيرُ. لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا لَهَا مَا كَسَبَتْ وَعَلَيْهَا مَا اكْتَسَبَتْ رَبَّنَا لَا تُؤَاخِذْنَا إِنْ نَّسِينَآ أَوْ أَخْطَأْنَا رَبَّنَا وَلَا تَحْمِلْ عَلَيْنَا إِصْرًا كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِنْ قَبْلِنَا رَبَّنَا وَلَا تُحَمِّلْنَا مَا لَا طَاقَةَ لَنَا بِهِ وَاعْفُ عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَا أَنْتَ مَوْلَانَا فَانْصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ.} [البقرة 285 - 286].""",
        count: 1),
    const ZikrEntity(
        id: 3,
        category: 'evening',
        title: 'سورة الإخلاص',
        content: """بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
قُلْ هُوَ ٱللَّهُ أَحَدٌ، ٱللَّهُ ٱلصَّمَدُ، لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُن لَّهُۥ كُفُوًا أَحَدٌۢ.""",
        count: 3),
    const ZikrEntity(
        id: 4,
        category: 'evening',
        title: 'سورة الفلق',
        content: """بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
قُلْ أَعُوذُ بِرَبِّ ٱلْفَلَقِ، مِن شَرِّ مَا خَلَقَ، وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ، وَمِن شَرِّ ٱلنَّفَّٰثَٰتِ فِى ٱلْعُقَدِ، وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ.""",
        count: 3),
    const ZikrEntity(
        id: 5,
        category: 'evening',
        title: 'سورة الناس',
        content: """بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ، مَلِكِ ٱلنَّاسِ، إِلَٰهِ ٱلنَّاسِ، مِن شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ، ٱلَّذِى يُوَسْوِسُ فِى صُدُورِ ٱلنَّاسِ، مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ.""",
        count: 3),
    const ZikrEntity(
        id: 6,
        category: 'evening',
        content:
            """أَمْسَيْـنا وَأَمْسـى المـلكُ لله وَالحَمدُ لله ، لا إلهَ إلاّ اللّهُ وَحدَهُ لا شَريكَ لهُ، لهُ المُـلكُ ولهُ الحَمْـد، وهُوَ على كلّ شَيءٍ قدير ، رَبِّ أسْـأَلُـكَ خَـيرَ ما في هـذهِ اللَّـيْلَةِ وَخَـيرَ ما بَعْـدَهـا ، وَأَعـوذُ بِكَ مِنْ شَـرِّ ما في هـذهِ اللَّـيْلةِ وَشَرِّ ما بَعْـدَهـا ، رَبِّ أَعـوذُبِكَ مِنَ الْكَسَـلِ وَسـوءِ الْكِـبَر ، رَبِّ أَعـوذُ بِكَ مِنْ عَـذابٍ في النّـارِ وَعَـذابٍ في القَـبْر. """,
        count: 1),
    const ZikrEntity(
        id: 7,
        category: 'evening',
        content:
            """اللّهـمَّ أَنْتَ رَبِّـي لا إلهَ إلاّ أَنْتَ ، خَلَقْتَنـي وَأَنا عَبْـدُك ، وَأَنا عَلـى عَهْـدِكَ وَوَعْـدِكَ ما اسْتَـطَعْـت ، أَعـوذُبِكَ مِنْ شَـرِّ ما صَنَـعْت ، أَبـوءُ لَـكَ بِنِعْـمَتِـكَ عَلَـيَّ وَأَبـوءُ بِذَنْـبي فَاغْفـِرْ لي فَإِنَّـهُ لا يَغْـفِرُ الذُّنـوبَ إِلاّ أَنْتَ .  """,
        count: 1),
    const ZikrEntity(
        id: 8,
        category: 'evening',
        content:
            """رَضيـتُ بِاللهِ رَبَّـاً وَبِالإسْلامِ ديـناً وَبِمُحَـمَّدٍ صلى الله عليه وسلم نَبِيّـاً.""",
        count: 3),
    const ZikrEntity(
        id: 9,
        category: 'evening',
        content:
            """اللّهُـمَّ إِنِّـي أَمسيتُ أُشْـهِدُك ، وَأُشْـهِدُ حَمَلَـةَ عَـرْشِـك ، وَمَلَائِكَتَكَ ، وَجَمـيعَ خَلْـقِك ، أَنَّـكَ أَنْـتَ اللهُ لا إلهَ إلاّ أَنْـتَ وَحْـدَكَ لا شَريكَ لَـك ، وَأَنَّ ُ مُحَمّـداً عَبْـدُكَ وَرَسـولُـك. """,
        count: 4),
    const ZikrEntity(
        id: 10,
        category: 'evening',
        content:
            """اللّهُـمَّ ما أَمسى بي مِـنْ نِعْـمَةٍ أَو بِأَحَـدٍ مِـنْ خَلْـقِك ، فَمِـنْكَ وَحْـدَكَ لا شريكَ لَـك ، فَلَـكَ الْحَمْـدُ وَلَـكَ الشُّكْـر. """,
        count: 1),
    const ZikrEntity(
        id: 11,
        category: 'evening',
        content:
            """حَسْبِـيَ اللّهُ لا إلهَ إلاّ هُوَ عَلَـيهِ تَوَكَّـلتُ وَهُوَ رَبُّ العَرْشِ العَظـيم.  """,
        count: 7),
    const ZikrEntity(
        id: 12,
        category: 'evening',
        content:
            """بِسـمِ اللهِ الذي لا يَضُـرُّ مَعَ اسمِـهِ شَيءٌ في الأرْضِ وَلا في السّمـاءِ وَهـوَ السّمـيعُ العَلـيم. """,
        count: 3),
    const ZikrEntity(
        id: 13,
        category: 'evening',
        content:
            """اللّهُـمَّ بِكَ أَمْسَـينا وَبِكَ أَصْـبَحْنا، وَبِكَ نَحْـيا وَبِكَ نَمُـوتُ وَإِلَـيْكَ الْمَصِيرُ. """,
        count: 1),
    const ZikrEntity(
        id: 14,
        category: 'evening',
        content:
            """أَمْسَيْنَا عَلَى فِطْرَةِ الإسْلاَمِ، وَعَلَى كَلِمَةِ الإِخْلاَصِ، وَعَلَى دِينِ نَبِيِّنَا مُحَمَّدٍ صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ، وَعَلَى مِلَّةِ أَبِينَا إبْرَاهِيمَ حَنِيفاً مُسْلِماً وَمَا كَانَ مِنَ المُشْرِكِينَ.  """,
        count: 1),
    const ZikrEntity(
        id: 15,
        category: 'evening',
        content:
            """سُبْحـانَ اللهِ وَبِحَمْـدِهِ عَدَدَ خَلْـقِه ، وَرِضـا نَفْسِـه ، وَزِنَـةَ عَـرْشِـه ، وَمِـدادَ كَلِمـاتِـه. """,
        count: 3),
    const ZikrEntity(
        id: 16,
        category: 'evening',
        content:
            """اللّهُـمَّ عافِـني في بَدَنـي ، اللّهُـمَّ عافِـني في سَمْـعي ، اللّهُـمَّ عافِـني في بَصَـري ، لا إلهَ إلاّ أَنْـتَ. """,
        count: 3),
    const ZikrEntity(
        id: 17,
        category: 'evening',
        content:
            """اللّهُـمَّ إِنّـي أَعـوذُ بِكَ مِنَ الْكُـفر ، وَالفَـقْر ، وَأَعـوذُ بِكَ مِنْ عَذابِ القَـبْر ، لا إلهَ إلاّ أَنْـتَ. """,
        count: 3),
    const ZikrEntity(
        id: 18,
        category: 'evening',
        content:
            """اللّهُـمَّ إِنِّـي أسْـأَلُـكَ العَـفْوَ وَالعـافِـيةَ في الدُّنْـيا وَالآخِـرَة ، اللّهُـمَّ إِنِّـي أسْـأَلُـكَ العَـفْوَ وَالعـافِـيةَ في ديني وَدُنْـيايَ وَأهْـلي وَمالـي ، اللّهُـمَّ اسْتُـرْ عـوْراتي وَآمِـنْ رَوْعاتـي ، اللّهُـمَّ احْفَظْـني مِن بَـينِ يَدَيَّ وَمِن خَلْفـي وَعَن يَمـيني وَعَن شِمـالي ، وَمِن فَوْقـي ، وَأَعـوذُ بِعَظَمَـتِكَ أَن أُغْـتالَ مِن تَحْتـي. """,
        count: 1),
    const ZikrEntity(
        id: 19,
        category: 'evening',
        content: """
يَا حَيُّ يَا قيُّومُ بِرَحْمَتِكَ أسْتَغِيثُ أصْلِحْ لِي شَأنِي كُلَّهُ وَلاَ تَكِلْنِي إلَى نَفْسِي طَـرْفَةَ عَيْنٍ. 
""",
        count: 3),
    const ZikrEntity(
        id: 20,
        category: 'evening',
        content:
            """أَمْسَيْنا وَأَمْسَى الْمُلْكُ للهِ رَبِّ الْعَالَمَيْنِ، اللَّهُمَّ إِنَّي أسْأَلُكَ خَيْرَ هَذَه اللَّيْلَةِ فَتْحَهَا ونَصْرَهَا، ونُوْرَهَا وبَرَكَتهَا، وَهُدَاهَا، وَأَعُوذُ بِكَ مِنْ شَرِّ مَا فيهِا وَشَرَّ مَا بَعْدَهَا. """,
        count: 1),
    const ZikrEntity(
        id: 21,
        category: 'evening',
        content:
            """اللّهُـمَّ عالِـمَ الغَـيْبِ وَالشّـهادَةِ فاطِـرَ السّماواتِ وَالأرْضِ رَبَّ كـلِّ شَـيءٍ وَمَليـكَه ، أَشْهَـدُ أَنْ لا إِلـهَ إِلاّ أَنْت ، أَعـوذُ بِكَ مِن شَـرِّ نَفْسـي وَمِن شَـرِّ الشَّيْـطانِ وَشِرْكِهِ ، وَأَنْ أَقْتَـرِفَ عَلـى نَفْسـي سوءاً أَوْ أَجُـرَّهُ إِلـى مُسْـلِم. """,
        count: 1),
    const ZikrEntity(
        id: 22,
        category: 'evening',
        content:
            """أَعـوذُ بِكَلِمـاتِ اللّهِ التّـامّـاتِ مِنْ شَـرِّ ما خَلَـق. """,
        count: 3),
    const ZikrEntity(
        id: 23,
        category: 'evening',
        content:
            """اللَّهُمَّ صَلِّ وَسَلِّمْ وَبَارِكْ على نَبِيِّنَا مُحمَّد. """,
        count: 10),
    const ZikrEntity(
        id: 24,
        category: 'evening',
        content:
            """اللَّهُمَّ إِنَّا نَعُوذُ بِكَ مِنْ أَنْ نُشْرِكَ بِكَ شَيْئًا نَعْلَمُهُ ، وَنَسْتَغْفِرُكَ لِمَا لَا نَعْلَمُهُ. """,
        count: 3),
    const ZikrEntity(
        id: 25,
        category: 'evening',
        content:
            """اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ الْهَمِّ وَالْحَزَنِ، وَأَعُوذُ بِكَ مِنْ الْعَجْزِ وَالْكَسَلِ، وَأَعُوذُ بِكَ مِنْ الْجُبْنِ وَالْبُخْلِ، وَأَعُوذُ بِكَ مِنْ غَلَبَةِ الدَّيْنِ، وَقَهْرِ الرِّجَالِ. """,
        count: 3),
    const ZikrEntity(
        id: 26,
        category: 'evening',
        content:
            """أسْتَغْفِرُ اللهَ العَظِيمَ الَّذِي لاَ إلَهَ إلاَّ هُوَ، الحَيُّ القَيُّومُ، وَأتُوبُ إلَيهِ. """,
        count: 3),
    const ZikrEntity(
        id: 27,
        category: 'evening',
        content:
            """يَا رَبِّ , لَكَ الْحَمْدُ كَمَا يَنْبَغِي لِجَلَالِ وَجْهِكَ , وَلِعَظِيمِ سُلْطَانِكَ. """,
        count: 3),
    const ZikrEntity(
        id: 28,
        category: 'evening',
        content:
            """لَا إلَه إلّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءِ قَدِيرِ. """,
        count: 100),
    const ZikrEntity(
        id: 29,
        category: 'evening',
        content:
            """اللَّهُمَّ أَنْتَ رَبِّي لا إِلَهَ إِلا أَنْتَ ، عَلَيْكَ تَوَكَّلْتُ ، وَأَنْتَ رَبُّ الْعَرْشِ الْعَظِيمِ , مَا شَاءَ اللَّهُ كَانَ ، وَمَا لَمْ يَشَأْ لَمْ يَكُنْ ، وَلا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ الْعَلِيِّ الْعَظِيمِ , أَعْلَمُ أَنَّ اللَّهَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ ، وَأَنَّ اللَّهَ قَدْ أَحَاطَ بِكُلِّ شَيْءٍ عِلْمًا , اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ شَرِّ نَفْسِي ، وَمِنْ شَرِّ كُلِّ دَابَّةٍ أَنْتَ آخِذٌ بِنَاصِيَتِهَا ، إِنَّ رَبِّي عَلَى صِرَاطٍ مُسْتَقِيمٍ. """,
        count: 1),
    const ZikrEntity(
        id: 30,
        category: 'evening',
        content: """سُبْحـانَ اللهِ وَبِحَمْـدِهِ. """,
        count: 100),
  ];

  static List<ZikrEntity> conditionAzkar = [
    const ZikrEntity(
        id: 1,
        category: 'newClothes',
        titleEn: "New Clothes",
        count: 1,
        title: "لبس ثوب جديد",
        content:
            "اللَّهُمَّ لَكَ الحَمْدُ أَنْتَ كَسَوْتَنِيْهِ أَسْأَلُكَ مِنْ خَيْرِهِ، وَخَيْرِ مَا صُنِعَ لَهُ، وَأَعُوذُ بِكَ مِنْ شَرِّهِ، وَشَرِّ مَا صُنِعَ لَهُ",
        description:
            "عن أبي سعيد الخدري رضي الله عنه قال: كَانَ رَسُولُ الله- صلى الله عليه وسلم- إذَا اسْتَجَدَّ ثَوباً سَمَّاه بِاسْمِهِ: إمَّا قَمِيصاً أَوْ عِمَامَةً ثُمَّ يَقُولُ: «اللَّهُمَّ لَكَ الحَمْدُ أَنْتَ كَسَوْتَنِيْهِ أَسْأَلُكَ مِنْ خَيْرِهِ، وَخَيْرِ مَا صُنِعَ لَهُ، وَأَعُوذُ بِكَ مِنْ شَرِّهِ، وَشَرِّ مَا صُنِعَ لَهُ». قَالَ أَبُو نَضْرَةَ: فَكَانَ أَصْحَابُ النَّبِيِّ- صلى الله عليه وسلم- إذَا لَبِسَ أَحَدُهُمْ ثَوباً جَدِيداً قِيلَ لَهُ: تُبْلِي وَيُخْلِفُ الله تَعَالَى. أخرجه أبو داود والترمذي"),
    const ZikrEntity(
        id: 2,
        category: 'leavingHome',
        titleEn: "Leaving Home",
        count: 1,
        title: "الخروج من البيت",
        content:
            "بسم الله تَوكّلت عَلى الله اللَّهُمَّ إنّا نعُوذُ بِكَ من أَنْ نزِلَّ أَوْ نضِلَّ، أَوْ نظْلِمَ أَوْ نُظْلَمَ، أَوْ نجْهَلَ أَوْ يُجْهَلَ عَلَينا",
        description: """
عن أم سلمة رضي الله عنها أن النَّبِيَّ- صلى الله عليه وسلم- كان إذا خَرج مِنْ بَيْتِه قَالَ: «بسم الله تَوكّلت عَلى الله اللَّهُمَّ إنّا نعُوذُ بِكَ من أَنْ نزِلَّ أَوْ نضِلَّ، أَوْ نظْلِمَ أَوْ نُظْلَمَ، أَوْ نجْهَلَ أَوْ يُجْهَلَ عَلَينا». أخرجه الترمذي والنسائي.
 وعن أنس بن مالك رضي الله عنه أن النبي- صلى الله عليه وسلم- قال: «إذَا خَرَجَ الرَّجُلُ مِنْ بَيْتِهِ فَقَالَ: بِاسْمِ الله، تَوَكَّلْتُ عَلَى الله، لا حَوْلَ وَلا قُوَّةَ إلَّا بِاللهِ» قَالَ: «يُقَالُ حِينَئِذٍ هُدِيتَ وَكُفِيتَ وَوُقِيتَ فَتَتَنَحَّى لَهُ الشَّيَاطِينُ، فَيَقُولُ لَهُ شَيْطَانٌ آخَرُ: كَيفَ لَكَ بِرَجُلٍ قَدْ هُدِيَ وَكُفِيَ وَوُقِيَ». أخرجه أبو داود والترمذي
"""),
    const ZikrEntity(
        id: 3,
        category: 'enteringBathroom',
        titleEn: "Entering the Bathroom",
        count: 1,
        title: "دخول دورة المياة",
        content: "اللَّهُمَّ إنِّي أَعُوذُ بِكَ مِنَ الخُبْثِ وَالخَبَائِثِ",
        description: """
عن أنس رضي الله عنه قال: كان النبي- صلى الله عليه وسلم- إذا دخل الخلاء قال: «اللَّهُمَّ إنِّي أَعُوذُ بِكَ مِنَ الخُبْثِ وَالخَبَائِثِ». متفق عليه"""),
    const ZikrEntity(
        id: 4,
        category: 'leavingBathroom',
        titleEn: "Leaving the Bathroom",
        count: 1,
        title: "الخروج من دورة المياة",
        content: "غُفْرَانَكَ",
        description: """
عن عائشة رضي الله عنها أَنَّ النَّبِيَّ- صلى الله عليه وسلم- كَانَ إذَا خَرَجَ مِنَ الغَائِطِ قَالَ: «غُفْرَانَكَ». أخرجه أبو داود والترمذي
"""),
    const ZikrEntity(
        id: 5,
        category: 'enteringMosque',
        titleEn: "Entering the Mosque",
        count: 1,
        title: "دخول المسجد",
        content: "اللَّهُمَّ افْتَحْ لِي أَبْوَابَ رَحْمَتِكَ",
        description:
            """ إذا دخلَ أحدُكُمُ المسجِدَ ، فليسلِّم علَى النَّبيِّ صلَّى اللَّهُ عليهِ وسلَّمَ ، ثمَّ ليقُلْ : اللَّهمَّ افتَح لي أبوابَ رحمتِكَ ، وإذا خرجَ فليقُلْ : اللَّهمَّ إنِّي أسألُكَ مِن فضلِكَ. أخرجه ابن ماجه واللفظ له، وأخرجه مسلم باختلاف يسير"""),
    const ZikrEntity(
        id: 6,
        category: 'leavingMosque',
        titleEn: "Leaving the Mosque",
        count: 1,
        title: "الخروج من المسجد",
        content: "اللَّهُمَّ إنِّي أسْأَلُكَ مِن فَضْلِكَ",
        description: """
إذا دَخَلَ أحَدُكُمُ المَسْجِدَ، فَلْيَقُلِ: اللَّهُمَّ افْتَحْ لي أبْوابَ رَحْمَتِكَ، وإذا خَرَجَ، فَلْيَقُلِ: اللَّهُمَّ إنِّي أسْأَلُكَ مِن فَضْلِكَ.
الراوي : أبو حميد أو أبو أسيد الساعدي.حديث صحيح رواه مسلم 
"""),
    const ZikrEntity(
        id: 7,
        category: 'hearingAdhan',
        titleEn: "Hearing the Adhan",
        count: 1,
        title: "1 سماع الأذان",
        content: "قل كما يقول المؤذن. ثم صل على النبي",
        description: """
عن عبد الله بن عمرو بن العاص رضي الله عنهما أنه سمع النبي- صلى الله عليه وسلم- يقول: «إذَا سَمِعْتُمُ المُؤَذِّنَ فَقُولُوا مِثْلَ مَا يَقُولُ، ثُمَّ صَلُّوا عَلَيَّ؛ فَإنَّهُ مَنْ صَلَّى عَلَيَّ صَلاةً صَلَّى الله عَلَيهِ بِهَا عَشْراً، ثُمَّ سَلُوا الله لِيَ الوَسِيلَةَ فَإنَّهَا مَنْزِلَةٌ فِي الجَنَّةِ لا تَنْبَغِي إلَّا لِعَبْدٍ مِنْ عِبَادِ الله، وَأَرْجُو أَنْ أَكُونَ أَنَا هُوَ، فَمَنْ سَأَلَ لِيَ الوَسِيلَةَ حَلَّتْ لَهُ الشَّفَاعَةُ». أخرجه مسلم."""),
    const ZikrEntity(
        id: 8,
        category: 'hearingAdhan',
        titleEn: "Hearing the Adhan",
        count: 1,
        title: "2 سماع الأذان",
        content:
            "أَشْهَدُ أَنْ لا إلَهَ إلَّا الله وَحْدَهُ لا شَرِيكَ لَهُ، وَأَنَّ مُحَمَّداً عَبْدُهُ وَرَسُولُهُ، رَضِيتُ بِالله رَبّاً، وَبِمُحَمَّدٍ رَسُولاً، وَبِالإسْلامِ دِيناً",
        description: """
عن سعد بن أبي وقاص رضي الله عنه عن رسول الله- صلى الله عليه وسلم- أَنَّهُ قَالَ: «مَنْ قَالَ حِينَ يَسْمَعُ المُؤَذِّنَ: أَشْهَدُ أَنْ لا إلَهَ إلَّا الله وَحْدَهُ لا شَرِيكَ لَهُ، وَأَنَّ مُحَمَّداً عَبْدُهُ وَرَسُولُهُ، رَضِيتُ بِالله رَبّاً، وَبِمُحَمَّدٍ رَسُولاً، وَبِالإسْلامِ دِيناً، غُفِرَ لَهُ ذَنْبُهُ». أخرجه مسلم
"""),
    const ZikrEntity(
        id: 9,
        category: 'afterAdhan',
        titleEn: "After the Adhan",
        count: 1,
        title: "بعد سماع الأذان",
        content:
            "اللَّهُمَّ رَبَّ هَذِهِ الدَّعْوَةِ التَّامَّةِ، وَالصَّلاةِ القَائِمَةِ، آتِ مُحَمَّداً الوَسِيلَةَ وَالفَضِيلَةَ، وَابْعَثْهُ مَقَاماً مَحْمُوداً الَّذِي وَعَدْتَهُ",
        description: """
عن جابر بن عبد الله رضي الله عنهما أن رسول الله- صلى الله عليه وسلم- قال: «مَنْ قَالَ حِينَ يَسْمَعُ النِّدَاءَ: اللَّهُمَّ رَبَّ هَذِهِ الدَّعْوَةِ التَّامَّةِ، وَالصَّلاةِ القَائِمَةِ، آتِ مُحَمَّداً الوَسِيلَةَ وَالفَضِيلَةَ، وَابْعَثْهُ مَقَاماً مَحْمُوداً الَّذِي وَعَدْتَهُ، حَلَّتْ لَهُ شَفَاعَتِي يَومَ القِيَامَةِ». أخرجه البخاري."""),
    const ZikrEntity(
        id: 10,
        category: 'distress',
        titleEn: "At Distress",
        count: 1,
        title: "عند الكرب",
        content:
            "لا إلَهَ إلَّا الله العَظِيمُ الحَلِيمُ، لا إلَهَ إلَّا الله رَبُّ العَرْشِ العَظِيمِ، لا إلَهَ إلَّا الله رَبُّ السَّماَوَاتِ، وَرَبُّ الأَرْضِ، وَرَبُّ العَرْشِ الكَريمِ",
        description: """
عن ابن عباس رضي الله عنهما أَنَّ رَسُولَ الله- صلى الله عليه وسلم- كَانَ يَقُولُ عِنْدَ الكَرْبِ: «لا إلَهَ إلَّا الله العَظِيمُ الحَلِيمُ، لا إلَهَ إلَّا الله رَبُّ العَرْشِ العَظِيمِ، لا إلَهَ إلَّا الله رَبُّ السَّماَوَاتِ، وَرَبُّ الأَرْضِ، وَرَبُّ العَرْشِ الكَريمِ». متفق عليه."""),
    const ZikrEntity(
        id: 11,
        category: 'sadness',
        titleEn: "Sadness or Grief",
        count: 1,
        title: "عند الهَمّ أو الحزن",
        content:
            "اللَّهُمَّ إنِّي عَبْدُكَ، وَابْنُ عَبْدِكَ، وَابْنُ أَمَتِكَ نَاصِيَتِي بِيَدِكَ، مَاضٍ فِيَّ حُكْمُكَ، عَدْلٌ فِيَّ قَضَاؤُكَ، أَسْأَلُكَ بِكُلِّ اسْمٍ هُوَ لَكَ سَمَّيْتَ بِهِ نَفْسَكَ، أَوْ عَلَّمْتَهُ أَحَداً مِن خَلْقِكَ، أَوْ أَنْزَلْتَهُ فِي كِتَابِكَ، أَوْ اسْتَأْثَرْتَ بِهِ فِي عِلْمِ الغَيْبِ عِنْدَكَ، أَنْ تَجْعَلَ القُرآنَ رَبِيعَ قَلْبِي، وَنُورَ صَدْرِي، وَجِلاءَ حُزْنِي وَذَهَابَ هَمِّي",
        description: """
عن عبد الله بن مسعود رضي الله عنه قال: قال رسول الله- صلى الله عليه وسلم-: «مَا أَصَابَ أَحَداً قَطُّ هَمٌّ وَلا حُزْنٌ فَقَالَ: اللَّهُمَّ إنِّي عَبْدُكَ، وَابْنُ عَبْدِكَ، وَابْنُ أَمَتِكَ نَاصِيَتِي بِيَدِكَ، مَاضٍ فِيَّ حُكْمُكَ، عَدْلٌ فِيَّ قَضَاؤُكَ، أَسْأَلُكَ بِكُلِّ اسْمٍ هُوَ لَكَ سَمَّيْتَ بِهِ نَفْسَكَ، أَوْ عَلَّمْتَهُ أَحَداً مِن خَلْقِكَ، أَوْ أَنْزَلْتَهُ فِي كِتَابِكَ، أَوْ اسْتَأْثَرْتَ بِهِ فِي عِلْمِ الغَيْبِ عِنْدَكَ، أَنْ تَجْعَلَ القُرآنَ رَبِيعَ قَلْبِي، وَنُورَ صَدْرِي، وَجِلاءَ حُزْنِي وَذَهَابَ هَمِّي، إلَّا أَذْهَبَ الله هَمَّهُ وَحُزْنَهُ وَأَبْدَلَهُ مَكَانَهُ فَرَحَاً» قَالَ: فَقِيلَ: يَا رَسُولَ الله ألا نَتَعَلَّمُهَا فَقَالَ: «بَلَى يَنْبَغِي لِمَنْ سَمِعَهَا أَنْ يَتَعَلَّمَهَا». أخرجه أحمد.
"""),
    const ZikrEntity(
        id: 12,
        category: 'fearOfPeople',
        titleEn: "Fear of People",
        count: 1,
        title: "عند الخوف من قوم",
        content:
            "اللَّهُمَّ إنَّا نَجْعَلُكَ فِي نُحُورِهِمْ، وَنَعُوذُ بِكَ مِنْ شُرُورِهِمْ",
        description: """
أنَّ النبيَّ صلَّى اللهُ عليهِ وسلَّمَ كان إذا خاف قومًا قال : اللهمَّ إنَّا نجعلُكَ في نحورهم ، ونعوذُ بكَ من شرورهم.الراوي أبو موسى الأشعري أخرجه أبو داود واللفظ له، وأحمد باختلاف يسيرو إسناده صحيح"""),
    const ZikrEntity(
        id: 13,
        category: 'meetingEnemy',
        titleEn: "Meeting an Enemy",
        count: 1,
        title: "عند لقاء العدو",
        content: "حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ",
        description: """
وعن ابن عباس رضي الله عنهما: {حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ} قَالَهَا إبرَاهِيمُ عَلَيهِ السَّلامُ حِينَ أُلْقِيَ فِي النَّارِ، وَقَالَهَا مُحَمَّدٌ- صلى الله عليه وسلم- حِينَ قَالُوا: {إِنَّ النَّاسَ قَدْ جَمَعُوا لَكُمْ فَاخْشَوْهُمْ فَزَادَهُمْ إِيمَانًا وَقَالُوا حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ}.
أخرجه البخاري.
"""),
    const ZikrEntity(
        id: 14,
        category: 'overwhelmed',
        titleEn: "When Overwhelmed",
        count: 1,
        title: "إذا غلبك أمر",
        content: "قَدَرُ الله وَمَا شَاءَ فَعَلَ",
        description: """
عن أبي هريرة رضي الله عنه قال: قال رسول الله- صلى الله عليه وسلم-: «المُؤْمِنُ القَوِيُّ خَيرٌ وَأَحَبُّ إلَى الله مِنَ المُؤْمِنِ الضَّعِيفِ، وَفِي كُلٍّ خَيْرٌ، احْرِصْ عَلَى مَا يَنْفَعُكَ، وَاسْتَعِنْ بِالله وَلا تَعْجَزْ، وَإنْ أَصَابَكَ شَيْءٌ فَلا تَقُلْ: لَو أَنِّي فَعَلْتُ كَانَ كَذَا وَكَذَا، وَلَكِنْ قُلْ: قَدَرُ الله وَمَا شَاءَ فَعَلَ، فَإنَّ لَوْ تَفْتَحُ عَمَلَ الشَّيْطَانِ». أخرجه مسلم"""),
    const ZikrEntity(
        id: 15,
        category: 'afterSin',
        titleEn: "After a Sin",
        count: 1,
        title: "عند فعل ذنب",
        content:
            "فَيُحْسِنُ الطُّهُورَ، ثُمَّ يَقُومُ فَيُصَلِّي رَكْعَتَينِ، ثُمَّ يَسْتَغْفِرُ الله",
        description: """
عن أبي بكر رضي الله عنه قال: سمعت رسول الله- صلى الله عليه وسلم- يقول: «مَا مِنْ عَبْدٍ يُذْنِبُ ذَنْباً فَيُحْسِنُ الطُّهُورَ، ثُمَّ يَقُومُ فَيُصَلِّي رَكْعَتَينِ، ثُمَّ يَسْتَغْفِرُ الله إلَّا غَفَرَ الله لَهُ»، ثم قرأ هذه الآية: {وَالَّذِينَ إِذَا فَعَلُوا فَاحِشَةً أَوْ ظَلَمُوا أَنْفُسَهُمْ ذَكَرُوا اللَّهَ} إلى آخر الآية. أخرجه أبو داود والترمذي
"""),
    const ZikrEntity(
        id: 16,
        category: 'unpaidDebt',
        titleEn: "Unpaid Debt",
        count: 1,
        title: "من عليه دين عجز عنه",
        content:
            "اللَّهُمَّ اكْفِنِي بِحَلالِكَ عَنْ حَرَامِكَ، وَأَغَنِنِي بِفَضْلِكَ عَمَّنْ سِوَاكَ",
        description: """
عن علي رضي الله عنه أَنَّ مُكَاتَباً جَاءَهُ فَقَالَ: إنِّي قَدْ عَجَزْتُ عَنْ كِتَابَتِي فَأَعِنِّي قَالَ: أَلا أُعَلِّمُكَ كَلِمَاتٍ عَلَّمَنِيهِنَّ رَسُولُ الله- صلى الله عليه وسلم- لَوْ كَانَ عَلَيْكَ مِثْلُ جَبَلِ ثَبِيرٍ دَيْناً أَدَّاهُ الله عَنْكَ؟ قال: قُلْ: «اللَّهُمَّ اكْفِنِي بِحَلالِكَ عَنْ حَرَامِكَ، وَأَغَنِنِي بِفَضْلِكَ عَمَّنْ سِوَاكَ». أخرجه الترمذي"""),
    const ZikrEntity(
        id: 17,
        category: 'anger',
        titleEn: "Anger",
        count: 1,
        title: "عند الغضب",
        content: "أَعُوذُ بِالله مِنَ الشَّيْطَانِ الرَّجِيمِ",
        description: """
عن سليمان بن صُرَد رضي الله عنه قال: اسْتَبَّ رَجُلانِ عِنْدَ النَّبِيِّ- صلى الله عليه وسلم- وَنَحْنُ عِنْدَهُ جُلُوسٌ وَأَحَدُهُمَا يَسُبُّ صَاحِبَهُ مُغْضَباً قَدِ احْمَرَّ وَجْهُهُ فَقَالَ النَّبِيُّ- صلى الله عليه وسلم-: «إنِّي لأَعْلَمُ كَلِمَةً لَو قَالَهَا لَذَهَبَ عَنْهُ مَا يَجِدُ، لَو قَالَ: أَعُوذُ بِالله مِنَ الشَّيْطَانِ الرَّجِيمِ..». رواه البخاري.

"""),
    const ZikrEntity(
        id: 18,
        category: 'leavingGathering',
        titleEn: "Leaving a Gathering",
        count: 1,
        title: "عند القيام من المجلس",
        content:
            "سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ، أَشْهَدُ أَنْ لا إلَهَ إلَّا أَنْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إلَيْكَ",
        description: """
عن أبي هريرة رضي الله عنه قال: قال رسول الله- صلى الله عليه وسلم-: «مَنْ جَلَسَ فِي مَجْلِسٍ فَكَثُرَ فِيهِ لَغَطُهُ فَقَالَ قَبْلَ أَنْ يَقُومَ مِنْ مَجْلِسِهِ ذَلِكَ: سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ، أَشْهَدُ أَنْ لا إلَهَ إلَّا أَنْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إلَيْكَ، إلَّا غُفِرَ لَهُ مَا كَانَ فِي مَجْلِسِهِ ذَلِكَ». أخرجه أحمد والترمذي
"""),
    const ZikrEntity(
        id: 19,
        category: 'seeingAfflicted',
        titleEn: "Seeing the Afflicted",
        count: 1,
        title: "إذا رأى مبتلى بمرض أو غيره",
        content:
            "الحمدُ للهِ الذي عافاني مما ابتلاكَ به ، و فضَّلني على كثيرٍ ممن خلق تفضيلًا",
        description: """
عن ابن عمر رضي الله عنهما قال: قال رسول الله- صلى الله عليه وسلم-: «مَنْ رَأَى مُبْتَلَىً فَقَالَ: الحَمْدُ للهِ الَّذِي عَافَانِي مِمَّا ابْتَلاكَ بِهِ، وَفَضَّلَنِي عَلَى كَثِيرٍ مِمَّنْ خَلَقَ تَفْضِيلاً لَمْ يُصِبْهُ ذَلِكَ البَلاءُ». أخرجه الطبراني في الأوسط.
"""),
    const ZikrEntity(
        id: 20,
        category: 'sleep',
        titleEn: "Sleep",
        count: 1,
        title: "عند النوم",
        content:
            "باسمِكَ ربي وضعْتُ جنبي وبكَ أرْفَعُهُ فإِنْ أمسَكْتَ نفسي فارحمْها وإِنْ أرسلْتَها فاحفظْها بِما تحفَظُ بِهِ عبادَكَ الصالِحينَ",
        description: """
إذا أوَى أحَدُكُمْ إلى فِراشِهِ، فَلْيَنْفُضْ فِراشَهُ بداخِلَةِ إزارِهِ؛ فإنَّه لا يَدْرِي ما خَلَفَهُ عليه، ثُمَّ يقولُ: باسْمِكَ رَبِّ، وضَعْتُ جَنْبِي، وبِكَ أرْفَعُهُ، إنْ أمْسَكْتَ نَفْسِي فارْحَمْها، وإنْ أرْسَلْتَها فاحْفَظْها بما تَحْفَظُ به عِبادَكَ الصَّالِحِينَ.
الراوي : أبو هريرة و المحدث : البخاري"""),
    const ZikrEntity(
        id: 21,
        category: 'wakingUp',
        titleEn: "Waking Up",
        count: 1,
        title: "عند الاستيقاظ",
        content:
            "الحَمْدُ لِلَّهِ الذي أحْيَانَا بَعْدَ ما أمَاتَنَا وإلَيْهِ النُّشُورُ",
        description:
            """كانَ النَّبيُّ صَلَّى اللهُ عليه وسلَّمَ إذَا أرَادَ أنْ يَنَامَ قالَ: باسْمِكَ اللَّهُمَّ أمُوتُ وأَحْيَا، وإذَا اسْتَيْقَظَ مِن مَنَامِهِ قالَ: الحَمْدُ لِلَّهِ الذي أحْيَانَا بَعْدَ ما أمَاتَنَا وإلَيْهِ النُّشُورُ.
الراوي : حذيفة بن اليمان و المحدث : البخاري"""),
    const ZikrEntity(
        id: 22,
        category: 'seeingSomethingPleasing',
        titleEn: "Seeing Something Pleasing",
        count: 1,
        title: "عند رؤية ما يعجبك",
        content: "ما شاء الله أو اللهم بارك فيه",
        description: """
وَلَوْلا إِذْ دَخَلْتَ جَنَّتَكَ قُلْتَ مَا شَاءَ اللَّهُ لا قُوَّةَ إِلَّا بِاللَّهِ[الكهف:39] .وفي الحديث: إذا رأى أحدُكم ما يُعجبُهُ في نَفسِهِ ، أو مالِهِ فليبرِّكْ علَيهِ فإنَّ العَينَ حقٌّ """),
    const ZikrEntity(
        id: 23,
        category: 'leavingHomeDua',
        titleEn: "Leaving the House",
        count: 1,
        title: "دعاء الخروج من المنزل",
        content:
            "اللَّهُمَّ أَعُوذُ بِكَ أَنْ أَضِلَّ، أَوْ أُضَلَّ، أَوْ أَزِلَّ، أَوْ أُزَلَّ، أَوْ أَظْلِمَ، أَوْ أُظْلَمَ، أَوْ أَجْهَلَ، أَوْ يُجْهَلَ عَلَيَّ",
        description: """
عن أمِّ سلمة رضي الله عنها قالت: ما خرج النبي صلى الله عليه وسلم من بيتي قطُّ إلا رفع طَرْفَهُ إلى السماء فقال: (اللَّهُمَّ أَعُوذُ بِكَ أَنْ أَضِلَّ، أَوْ أُضَلَّ، أَوْ أَزِلَّ، أَوْ أُزَلَّ، أَوْ أَظْلِمَ، أَوْ أُظْلَمَ، أَوْ أَجْهَلَ، أَوْ يُجْهَلَ عَلَيَّ)
"""),
    const ZikrEntity(
        id: 24,
        category: 'travel',
        titleEn: "Travel",
        count: 1,
        title: "دعـاء السفـر",
        content:
            "اللّهُمّ إِنّا نَسْأَلُكَ فِي سَفَرِنَا هَذَا الْبِرّ وَالتّقْوَىَ. وَمِنَ الْعَمَلِ مَا تَرْضَىَ. اللّهُمّ هَوّنْ عَلَيْنَا سَفَرَنَا هَذَا. وَاطْوِ عَنّا بُعْدَهُ. اللّهُمّ أَنْتَ الصّاحِبُ فِي السّفَرِ. وَالْخَلِيفَةُ فِي الأَهْلِ. اللّهُمّ إِنّي أَعُوذُ بِكَ مِنْ وَعْثَاءِ السّفَرِ، وَكَآبَةِ الْمَنْظَرِ، وَسُوءِ الْمُنْقَلَبِ، فِي الْمَالِ وَالأَهْلِ",
        description: """
روى مسلم في صحيحه عن ابْنَ عُمَرَ أَنّ رَسُولَ اللّهِ صلى الله عليه وسلم كَانَ إِذَا اسْتَوَىَ عَلَىَ بَعِيرِهِ خَارِجاً إِلَىَ سَفَرٍ، كَبّرَ ثَلاَثاً، ثُمّ قَالَ: سُبْحَانَ الّذِي سَخّرَ لَنَا هَذَا وَمَا كُنّا لَهُ مُقْرِنِينَ* وَإِنّا إِلَىَ رَبّنَا لَمُنْقَلِبُونَ. اللّهُمّ إِنّا نَسْأَلُكَ فِي سَفَرِنَا هَذَا الْبِرّ وَالتّقْوَىَ. وَمِنَ الْعَمَلِ مَا تَرْضَىَ. اللّهُمّ هَوّنْ عَلَيْنَا سَفَرَنَا هَذَا. وَاطْوِ عَنّا بُعْدَهُ. اللّهُمّ أَنْتَ الصّاحِبُ فِي السّفَرِ. وَالْخَلِيفَةُ فِي الأَهْلِ. اللّهُمّ إِنّي أَعُوذُ بِكَ مِنْ وَعْثَاءِ السّفَرِ، وَكَآبَةِ الْمَنْظَرِ، وَسُوءِ الْمُنْقَلَبِ، فِي الْمَالِ وَالأَهْلِ
"""),
    const ZikrEntity(
        id: 25,
        category: 'ridingMount',
        titleEn: "Riding a Mount",
        count: 1,
        title: "دعاء ركوب الدابة",
        content:
            "سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ * وَإِنَّا إِلَى رَبِّنَا لَمُنْقَلِبُونَ",
        description: """
لِتَسْتَوُوا عَلَىٰ ظُهُورِهِ ثُمَّ تَذْكُرُوا نِعْمَةَ رَبِّكُمْ إِذَا اسْتَوَيْتُمْ عَلَيْهِ وَتَقُولُوا سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَٰذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ (13) وَإِنَّا إِلَىٰ رَبِّنَا لَمُنقَلِبُونَ [الزخرف 14]
"""),
    const ZikrEntity(
        id: 26,
        category: 'visitingGraves',
        titleEn: "Visiting Graves",
        count: 1,
        title: "دعاء زيارة القبور",
        content:
            "السلام عليكم أهل الديار من المؤمنين والمسلمين وإنا إن شاء الله بكم لاحقون نسأل الله لنا ولكن العافية",
        description: """
يسن لزائر المقبرة أن يدعو بما ورد عن النبي صلى الله عليه وسلم، ومن ذلك ما روى مسلم من حديث سليمان بن بريدة عن أبيه، أن النبي صلى الله عليه وسلم كان يعلم أصحابه إذا خرجوا إلى المقابر أن يقولوا: "السلام عليكم أهل الديار من المؤمنين والمسلمين وإنا إن شاء الله بكم لاحقون نسأل الله لنا ولكن العافية."
""")
  ];

  static List<ZikrEntity> ruqyahAzkar = [
    const ZikrEntity(
        id: 27,
        category: 'ruqyah',
        titleEn: "Ruqyah",
        count: 1,
        title: 'سورة الفاتحة',
        content: """بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ، الرَّحْمَٰنِ الرَّحِيمِ، مَالِكِ يَوْمِ الدِّينِ، إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ، اهدِنَا الصِّرَاطَ المُستَقِيمَ، صِرَاطَ الَّذِينَ أَنعَمتَ عَلَيهِمْ غَيرِ المَغضُوبِ عَلَيهِمْ وَلَا الضَّالِّينَ""",
        description:
            """أعظم سورة في القرآن، وهي رقية بإذن الله، كما في حديث أبي سعيد الخدري رضي الله عنه في قصة الرقية بها. متفق عليه."""),
    const ZikrEntity(
        id: 28,
        category: 'ruqyah',
        titleEn: "Ruqyah",
        count: 1,
        title: 'آية الكرسى',
        content: """
أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ  بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيم {اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ} [آية الكرسى - البقرة 255]. """,
        description:
            """من أعظم آيات القرآن في الحفظ والرقية، من قرأها حين يصبح أُجير من الجن حتى يُمسي. رواه الحاكم وصححه الألباني."""),
    const ZikrEntity(
        id: 29,
        category: 'ruqyah',
        titleEn: "Ruqyah",
        count: 1,
        title: 'آخر آيتين من سورة البقرة',
        content: """أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ
{آمَنَ الرَّسُولُ بِمَا أُنْزِلَ إِلَيْهِ مِنْ رَبِّهِ وَالْمُؤْمِنُونَ ۚ كُلٌّ آمَنَ بِاللَّهِ وَمَلَائِكَتِهِ وَكُتُبِهِ وَرُسُلِهِ لَا نُفَرِّقُ بَيْنَ أَحَدٍ مِنْ رُسُلِهِ ۚ وَقَالُوا سَمِعْنَا وَأَطَعْنَا ۖ غُفْرَانَكَ رَبَّنَا وَإِلَيْكَ الْمَصِيرُ. لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا لَهَا مَا كَسَبَتْ وَعَلَيْهَا مَا اكْتَسَبَتْ رَبَّنَا لَا تُؤَاخِذْنَا إِنْ نَّسِينَآ أَوْ أَخْطَأْنَا رَبَّنَا وَلَا تَحْمِلْ عَلَيْنَا إِصْرًا كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِنْ قَبْلِنَا رَبَّنَا وَلَا تُحَمِّلْنَا مَا لَا طَاقَةَ لَنَا بِهِ وَاعْفُ عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَا أَنْتَ مَوْلَانَا فَانْصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ.} [البقرة 285 - 286].""",
        description:
            """من قرأهما في ليلة كفتاه، وهما من كنوز القرآن التي أُعطيها النبي ﷺ. رواه البخاري ومسلم."""),
    const ZikrEntity(
        id: 30,
        category: 'ruqyah',
        titleEn: "Ruqyah",
        count: 3,
        title: 'سورة الإخلاص (×3)',
        content: """بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
قُلْ هُوَ ٱللَّهُ أَحَدٌ، ٱللَّهُ ٱلصَّمَدُ، لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُن لَّهُۥ كُفُوًا أَحَدٌۢ""",
        description:
            """تُقرأ ثلاث مرات ضمن الرقية الشرعية بالمعوذات، اقتداءً بفعل النبي ﷺ عند رقية نفسه. متفق عليه."""),
    const ZikrEntity(
        id: 31,
        category: 'ruqyah',
        titleEn: "Ruqyah",
        count: 3,
        title: 'سورة الفلق (×3)',
        content: """بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
قُلْ أَعُوذُ بِرَبِّ ٱلْفَلَقِ، مِن شَرِّ مَا خَلَقَ، وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ، وَمِن شَرِّ ٱلنَّفَّٰثَٰتِ فِى ٱلْعُقَدِ، وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ""",
        description:
            """تُقرأ ثلاث مرات ضمن الرقية الشرعية بالمعوذات، اقتداءً بفعل النبي ﷺ عند رقية نفسه. متفق عليه."""),
    const ZikrEntity(
        id: 32,
        category: 'ruqyah',
        titleEn: "Ruqyah",
        count: 3,
        title: 'سورة الناس (×3)',
        content: """بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ، مَلِكِ ٱلنَّاسِ، إِلَٰهِ ٱلنَّاسِ، مِن شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ، ٱلَّذِى يُوَسْوِسُ فِى صُدُورِ ٱلنَّاسِ، مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ.""",
        description:
            """تُقرأ ثلاث مرات ضمن الرقية الشرعية بالمعوذات، اقتداءً بفعل النبي ﷺ عند رقية نفسه. متفق عليه."""),
    const ZikrEntity(
        id: 33,
        category: 'ruqyah',
        titleEn: "Ruqyah",
        count: 1,
        title: 'أذهب الباس',
        content:
            "أَذْهِبِ الْبَاْسَ رَبَّ النَّاسِ، اشْفِ أَنْتَ الشَّافِي، لَا شِفَاءَ إِلَّا شِفَاؤُكَ، شِفَاءً لَا يُغَادِرُ سَقَمًا",
        description:
            """كان النبي ﷺ يرقي بها بعض أهله، يمسح بيده اليمنى ويقول: أذهب الباس رب الناس، اشف أنت الشافي، لا شفاء إلا شفاؤك، شفاءً لا يغادر سقماً. متفق عليه."""),
    const ZikrEntity(
        id: 34,
        category: 'ruqyah',
        titleEn: "Ruqyah",
        count: 1,
        title: 'بسم الله أرقيك',
        content:
            "بِسْمِ اللَّهِ أَرْقِيكَ مِنْ كُلِّ شَيْءٍ يُؤْذِيكَ، مِنْ شَرِّ كُلِّ نَفْسٍ أَوْ عَيْنِ حَاسِدٍ اللَّهُ يَشْفِيكَ، بِسْمِ اللَّهِ أَرْقِيكَ",
        description:
            """رقية جبريل عليه السلام للنبي ﷺ، رواها مسلم عن أبي سعيد الخدري رضي الله عنه."""),
  ];

  static List<ZikrEntity> afterPrayerAzkar = [
    const ZikrEntity(
        id: 35,
        category: 'afterPrayer',
        titleEn: "After Prayer",
        count: 3,
        title: 'الاستغفار (×3)',
        content: "أستغفر الله",
        description:
            """كان النبي ﷺ إذا سلَّم من صلاته استغفر ثلاثاً. رواه مسلم عن ثوبان رضي الله عنه."""),
    const ZikrEntity(
        id: 36,
        category: 'afterPrayer',
        titleEn: "After Prayer",
        count: 1,
        title: 'اللهم أنت السلام',
        content:
            "اللَّهُمَّ أَنْتَ السَّلَامُ وَمِنْكَ السَّلَامُ تَبَارَكْتَ يَا ذَا الْجَلَالِ وَالْإِكْرَامِ",
        description:
            """كان النبي ﷺ يقولها عقب الاستغفار بعد كل صلاة. رواه مسلم عن ثوبان رضي الله عنه."""),
    const ZikrEntity(
        id: 37,
        category: 'afterPrayer',
        titleEn: "After Prayer",
        count: 1,
        title: 'آية الكرسى',
        content: """
أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ  بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيم {اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ} [آية الكرسى - البقرة 255]. """,
        description:
            """من قرأها دبر كل صلاة مكتوبة لم يمنعه من دخول الجنة إلا أن يموت. رواه النسائي وصححه الألباني."""),
    const ZikrEntity(
        id: 38,
        category: 'afterPrayer',
        titleEn: "After Prayer",
        count: 33,
        title: 'سبحان الله (×33)',
        content: "سبحان الله",
        description:
            """من سبَّح الله دبر كل صلاة ثلاثاً وثلاثين، وحمد الله ثلاثاً وثلاثين، وكبَّر الله ثلاثاً وثلاثين، فتلك تسع وتسعون، وقال تمام المائة: لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير، غُفرت خطاياه وإن كانت مثل زبد البحر. رواه مسلم عن أبي هريرة رضي الله عنه."""),
    const ZikrEntity(
        id: 39,
        category: 'afterPrayer',
        titleEn: "After Prayer",
        count: 33,
        title: 'الحمد لله (×33)',
        content: "الحمد لله",
        description:
            """جزء من تسبيح ما بعد الصلاة الوارد في حديث أبي هريرة رضي الله عنه. رواه مسلم."""),
    const ZikrEntity(
        id: 40,
        category: 'afterPrayer',
        titleEn: "After Prayer",
        count: 34,
        title: 'الله أكبر (×34)',
        content: "الله أكبر",
        description:
            """تمام التسبيح والتحميد والتكبير دبر كل صلاة أربعاً وثلاثين تكبيرة. رواه مسلم عن أبي هريرة رضي الله عنه."""),
    const ZikrEntity(
        id: 41,
        category: 'afterPrayer',
        titleEn: "After Prayer",
        count: 1,
        title: 'لا إله إلا الله وحده',
        content:
            "لا إله إلا الله وحده لا شريك له له الملك وله الحمد وهو على كل شيء قدير",
        description:
            """في حديث أبي هريرة يقول رسول الله ﷺ:(لا إلَهَ إلَّا اللَّهُ، وحْدَهُ لا شَرِيكَ له، له المُلْكُ وله الحَمْدُ، وهو علَى كُلِّ شَيءٍ قَدِيرٌ، في يَومٍ مِئَةَ مَرَّةٍ؛ كانَتْ له عَدْلَ عَشْرِ رِقابٍ، وكُتِبَتْ له مِئَةُ حَسَنَةٍ، ومُحِيَتْ عنْه مِئَةُ سَيِّئَةٍ...). رواه البخاري"""),
    const ZikrEntity(
        id: 42,
        category: 'afterPrayer',
        titleEn: "After Prayer",
        count: 3,
        title: 'المعوذتان (×3)',
        content: """بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
قُلْ أَعُوذُ بِرَبِّ ٱلْفَلَقِ، مِن شَرِّ مَا خَلَقَ، وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ، وَمِن شَرِّ ٱلنَّفَّٰثَٰتِ فِى ٱلْعُقَدِ، وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ
بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم
قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ، مَلِكِ ٱلنَّاسِ، إِلَٰهِ ٱلنَّاسِ، مِن شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ، ٱلَّذِى يُوَسْوِسُ فِى صُدُورِ ٱلنَّاسِ، مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ.""",
        description:
            """أمر النبي ﷺ عقبة بن عامر أن يقرأ بالمعوذتين دبر كل صلاة. رواه أبو داود والترمذي وصححه الألباني."""),
  ];

  static List<PrayerEntity> prayers = [
    const PrayerEntity(
        id: 0, content: "اللهم إنك عفو كريم تحب العفو، فاعفُ عني"),
    const PrayerEntity(
        id: 1,
        content:
            "اللهم ربنا لك الحمد أنت قيّم السماوات والأرض، ولك الحمد أنت رب السماوات والأرض ومن فيهن، ولك الحمد أنت نور السماوات والأرض ومن فيهن، أنت الحق، وقولك الحق، ووعدك الحق، ولقاؤك الحق، والجنة حق، والنار حق، والساعة حق، اللهم: لك أسلمت، وبك آمنت، وعليك توكلت، وإليك خاصمت، وبك حاكمت، فاغفر لي: ما قدمت، وما أخرت، وأسررت، وأعلنت، وما أنت أعلم به مني، لا إله إلا أنت"),
    const PrayerEntity(
        id: 2,
        content:
            "اللهم إني أعوذ بك من العجز والكسل والجبن والهرم والبخل، وأعوذ بك من عذاب القبر، ومن فتنة المحيا والممات"),
    const PrayerEntity(
        id: 3,
        content:
            "اللهم إني أعوذ بك من فتنة النار، وعذاب النار، وفتنة القبر، وعذاب القبر، ومن شر فتنة الغنى، ومن شر فتنة الفقر، وأعوذ بك من شر فتنة المسيح الدجال، اللهم اغسل خطاياي بماء الثلج والبرد، ونقِّ قلبي من الخطايا كما نقيت الثوب الأبيض من الدنس، وباعد بيني وبين خطاياي كما باعدت بين المشرق والمغرب، اللهم إني أعوذ بك من الكسل والهرم والمأثم والمغرم"),
    const PrayerEntity(
        id: 4,
        content:
            " أعوذ برضاك من سخطك، وبمعافاتك من عقوبتك، وأعوذ بك منك، لا أحصي ثناء عليك أنت كما أثنيت على نفسك"),
    const PrayerEntity(
        id: 5,
        content:
            "اللهم إني أعوذ بك من علم لا ينفع، وقلب لا يخشع، ودعاء لا يُسمع، ونفس لا تشبع"),
    const PrayerEntity(
        id: 6,
        content:
            "اللهم رحمتك أرجو فلا تكلني إلى نفسي طرفة عين، وأصلح لي شأني كله لا إله إلا أنت"),
    const PrayerEntity(
        id: 7,
        content: "ربنا آتنا في الدنيا حسنة وفي الآخرة حسنة وقنا عذاب النار"),
    const PrayerEntity(
        id: 8,
        content:
            "اللهم إني أسألك من الخير كله عاجله وآجله ما علمتُ منه وما لم أعلم، وأعوذ بك من الشر كله عاجله وآجله ما علمتُ منه وما لم أعلم، اللهم إني أسألك من خير ما سألك عبدك ونبيك، وأعوذ بك من شر ما عاذ به عبدك ونبيك، اللهم إني أسألك الجنة وما قرب إليها من قول أو عمل، وأعوذ بك من النار وما قرب إليها من قول أو عمل، وأسألك أن تجعل كل قضاء قضيته لي خيرا"),
    const PrayerEntity(
        id: 9,
        content:
            "اللهم بعلمك الغيب، وقدرتك على الخلق أحيني ما علمتَ الحياة خيراً لي، وتوفني إذا علمت الوفاة خيراً لي، اللهم وأسألك خشيتك في الغيب والشهادة، وأسألك كلمة الحق في الرضا والغضب، وأسألك القصد في الفقر والغنى، وأسألك نعيماً لا ينفد، وأسألك قرة عين لا تنقطع، وأسألك الرضاء بعد القضاء، وأسألك بَرْد العيش بعد الموت، وأسألك لذة النظر إلى وجهك والشوق إلى لقائك في غير ضراء مضرة، ولا فتنة مضلة، اللهم زينا بزينة الإيمان، واجعلنا هداة مهتدين"),
    const PrayerEntity(
        id: 10,
        content:
            "اللَّهُمَّ إِنِّي أَسْأَلُكَ الْمُعَافَاةَ فِي الدُّنْيَا وَالْآخِرَةِ"),
    const PrayerEntity(
        id: 11,
        content:
            "اللهم أنت ربي لا إله إلا أنت، خلقتني وأنا عبدك، وأنا على عهدك ووعدك ما استطعت، أعوذ بك من شر ما صنعت، أبوء لك بنعمتك علي، وأبوء لك بذنبي فاغفر لي، فإنه لا يغفر الذنوب إلا أنت"),
    const PrayerEntity(
        id: 12,
        content:
            " {رَبَّنَا ءاتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ}[البقرة: 201]"),
    const PrayerEntity(
        id: 13,
        content:
            "{رَبَّنَا ظَلَمْنَا أَنفُسَنَا وَإِنْ لَمْ تَغْفِرْ لَنَا وَتَرْحَمْنَا لَنَكُونَنَّ مِنْ الْخَاسِرِينَ}[الأعراف: 23]"),
    const PrayerEntity(
        id: 14,
        content:
            " {رَبَّنَا لا تُؤَاخِذْنَا إِنْ نَسِينَا أَوْ أَخْطَأْنَا رَبَّنَا وَلا تَحْمِلْ عَلَيْنَا إِصْرًا كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِنْ قَبْلِنَا رَبَّنَا وَلا تُحَمِّلْنَا مَا لا طَاقَةَ لَنَا بِهِ وَاعْفُ عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَا أَنْتَ مَوْلانَا فَانصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ}[البقرة: 286]"),
    const PrayerEntity(
        id: 15,
        content:
            "{رَبَّنَا هَبْ لَنَا مِنْ أَزْوَاجِنَا وَذُرِّيَّاتِنَا قُرَّةَ أَعْيُنٍ وَاجْعَلْنَا لِلْمُتَّقِينَ إِمَامًا}[الفرقان: 74] "),
    const PrayerEntity(
        id: 16,
        content:
            "{رَبِّ اغْفِرْ لِي وَلِوَالِدَيَّ وَلِمَنْ دَخَلَ بَيْتِي مُؤْمِنًا وَلِلْمُؤْمِنِينَ وَالْمُؤْمِنَاتِ}[نوح: 28] "),
    const PrayerEntity(
        id: 17,
        content:
            " {رَبِّ إِنِّي لِمَا أَنزَلْتَ إِلَيَّ مِنْ خَيْرٍ فَقِيرٌ}[القصص: 24]"),
    const PrayerEntity(
        id: 18,
        content:
            "{رَبَّنَا ءاتِنَا مِنْ لَدُنْكَ رَحْمَةً وَهَيِّئْ لَنَا مِنْ أَمْرِنَا رَشَدًا}[الكهف: 10] "),
    const PrayerEntity(
        id: 19,
        content:
            "{رَبِّ أَعُوذُ بِكَ مِنْ هَمَزَاتِ الشَّيَاطِينِ * وَأَعُوذُ بِكَ رَبِّ أَنْ يَحْضُرُونِ}[المؤمنون: 97-98] "),
    const PrayerEntity(
        id: 20,
        content:
            "{رَبَّنَا أَتْمِمْ لَنَا نُورَنَا وَاغْفِرْ لَنَا إِنَّكَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ}[التحريم: 8] "),
    const PrayerEntity(
        id: 21,
        content:
            "{رَبَّنَا إِنَّنَا آمَنَّا فَاغْفِرْ لَنَا ذُنُوبَنَا وَقِنَا عَذَابَ النَّارِ}[آل عمران: 16] "),
    const PrayerEntity(
        id: 22,
        content:
            "{رَبِّ هَبْ لِي مِنْ لَدُنْكَ ذُرِّيَّةً طَيِّبَةً إِنَّكَ سَمِيعُ الدُّعَاءِ}[آل عمران: 38] "),
    const PrayerEntity(
        id: 23,
        content:
            "اللهم إني ظلمت نفسي ظلما كثيرا ولا يغفر الذنوب إلا أنت، فاغفر لي مغفرة من عندك وارحمني، إنك أنت الغفور الرحيم"),
    const PrayerEntity(
        id: 24,
        content:
            "{رَبِّ أَوْزِعْنِي أَنْ أَشْكُرَ نِعْمَتَكَ الَّتِي أَنْعَمْتَ عَلَيَّ وَعَلَى وَالِدَيَّ وَأَنْ أَعْمَلَ صَالِحًا تَرْضَاهُ وَأَدْخِلْنِي بِرَحْمَتِكَ فِي عِبَادِكَ الصَّالِحِينَ}[النمل: 19]"),
    const PrayerEntity(
        id: 25,
        content:
            "اللهم صل على محمد وعلى آل محمد، كما صليت على إبراهيم، وعلى آل إبراهيم، إنك حميد مجيد، اللهم بارك على محمد وعلى آل محمد، كما باركت على إبراهيم وعلى آل إبراهيم، إنك حميد مجيد"),
    const PrayerEntity(
        id: 26,
        content:
            "اللهم إني أعوذ بك من الهم والحزن، والعجز والكسل، والجبن والبخل، وضلع الدين، وغلبة الرجال"),
    const PrayerEntity(
        id: 27,
        content:
            "اللهم إني أعوذ بك من زوال نعمتك، وتحول عافيتك وفجاءة نقمتك، وجميع سخطك"),
    const PrayerEntity(
        id: 28,
        content: "اللهم إني أعوذ بك من البرص والجنون والجذام ومن سيئ الأسقام"),
    const PrayerEntity(
        id: 29,
        content: "اللهم إني أعوذ بك من منكرات الأخلاق والأعمال والأهواء"),
    const PrayerEntity(
        id: 30,
        content:
            "اللهم إني أعوذ بك من الهدم وأعوذ بك من التردي وأعوذ بك من الغرق والحرق والهرم وأعوذ بك أن يتخبطني الشيطان عند الموت وأعوذ بك أن أموت في سبيلك مدبرا وأعوذ بك أن أموت لديغا"),
    const PrayerEntity(
        id: 31,
        content:
            "اللهم إني أسألك يا الله بأنك الواحد الأحد الصمد الذي لم يلد ولم يولد ولم يكن له كفوا أحد أن تغفر لي ذنوبي إنك أنت الغفور الرحيم"),
    const PrayerEntity(
        id: 32, content: "اللهم إني أسألك الهدى والتقى والعفاف والغنى"),
    const PrayerEntity(
        id: 33, content: "اللهم أعني على ذكرك وشكرك وحسن عبادتك"),
    const PrayerEntity(
        id: 34,
        content:
            "اللهم اغفر لي خطيئتي، وجهلي وإسرافي، في أمري وما أنت أعلم به مني، اللهم اغفر لي جدي وهزلي وخطئي وعمدي وكل ذلك عندي، اللهم اغفر لي ما قدمت وما أخرت وما أسررت وما أعلنت وما أنت أعلم به مني أنت المقدم وأنت المؤخر، وأنت على كل شيء قدير"),
    const PrayerEntity(
        id: 35,
        content:
            "اللهم حبب إلينا الإيمان وزينه في قلوبنا، وكره إلينا الكفر والفسوق والعصيان، واجعلنا من الراشدين، اللهم توفنا مسلمين وأحينا مسلمين وألحقنا بالصالحين غير خزايا ولا مفتونين"),
    const PrayerEntity(
        id: 36,
        content:
            "اللهم اغفر لي ذنبي كله، دقه وجله، وأوله وآخره، وعلانيته وسره"),
    const PrayerEntity(
        id: 37,
        content:
            "اللهم ربنا آتنا في الدنيا حسنة، وفي الآخرة حسنة، وقنا عذاب النار"),
    const PrayerEntity(id: 38, content: "يا مقلب القلوب ثبت قلبي على دينك"),
    const PrayerEntity(id: 39, content: "اللهم أحسنت خَلقي فأحسن خُلقي"),
    const PrayerEntity(
        id: 40,
        content:
            "اللهم أعوذ برضاك من سخطك، وبمعافاتك من عقوبتك، وأعوذ بك منك، لا أحصي ثناء عليك، أنت كما أثنيت على نفسك"),
    const PrayerEntity(
        id: 41,
        content:
            "اللهم اغفر لي ما قدمت وما أخرت، وما أسررت وما أعلنت، وما أسرفت، وما أنت أعلم به مني، أنت المقدم وأنت المؤخر، لا إله إلا أنت"),
    const PrayerEntity(
        id: 42,
        content:
            "اللهم اهدني فيمن هديت، وعافني فيمن عافيت، وتولني فيمن توليت، وبارك لي فيما أعطيت وقني شر ما قضيت، إنك تقضي ولا يقضى عليك، وإنه لا يذل من واليت ولا يعز من عاديت تباركت ربنا وتعاليت"),
    const PrayerEntity(
        id: 43,
        content: "أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ",
        transliteration: "Alā bidhikrillāhi taṭma'innul-qulūb.",
        translation: "Verily, in the remembrance of Allah do hearts find rest.",
        reference: "الرعد ٢٨"),
  ];
}
