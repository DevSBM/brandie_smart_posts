import 'package:brandie_smart_posts/core/constants/app_assets.dart';
import 'package:brandie_smart_posts/features/smart_post/data/models/product.dart';
import 'package:brandie_smart_posts/features/smart_post/data/models/recommended_song.dart';
import 'package:brandie_smart_posts/features/smart_post/data/models/smart_post.dart';

const SMART_POSTS = <SmartPost>[
  SmartPost(
    id: 'giordani-gold-eternal-glow-lipstick',
    caption:
        '''💄 Elevate your beauty with the Giordani Gold - Eternal Glow Lipstick SPF 25! This luxurious creamy lipstick doesn't just promise rich pigments but brings you the benefits of hyaluronic acid and collagen-boosting peptides too. Pamper your lips with care while enjoying a long-lasting, luminous matte colour.\n💋✨ #Oriflame #GiordaniGold #LipCareGoals''',
    song: RecommendedSong(title: 'Bad Habits', artist: 'Ed Sheeran'),
    imagePath: AppAssets.post1,
    product: Product(
      name: 'Giordani Gold Lipstick',
      imagePath: AppAssets.lipstickProduct,
      price: 14.99,
      discountPercentage: 30,
      trendingMessage: 'High-converting in Oriflame Community',
      productLink: 'www.oriflame.com/giordani/amanda3012',
    ),
    referralCode: 'UK-AMANDA3012',
    referralLink: 'www.oriflame.com/giordani/amanda3012',
  ),
  SmartPost(
    id: 'eclat-amour-fragrance',
    caption:
        '''✨ Experience the elegance of Eclat Amour—a fragrance that captures the essence of romance and sophistication. Let every spritz wrap you in timeless charm and effortless allure. 💕\n#EclatAmour #TimelessElegance''',
    song: RecommendedSong(title: 'Unstoppable', artist: 'Sia'),
    imagePath: AppAssets.post2,
    product: Product(
      name: 'Eclat Amour Fragrance',
      imagePath: AppAssets.post2,
      price: 49.99,
      discountPercentage: 20,
      trendingMessage: 'High-converting in Oriflame Community',
      productLink: 'www.oriflame.com/giordani/amanda3012',
    ),
    referralCode: 'UK-AMANDA3012',
    referralLink: 'www.oriflame.com/giordani/amanda3012',
  ),
  SmartPost(
    id: 'wonderlash-mascara',
    caption:
        '''Unlock the power of bold, beautiful lashes! With WonderLash Mascara, get ultimate length, volume, and definition for a stunning, eye-catching look. One swipe is all it takes! 💖\n#WonderLash #LashesForDays''',
    song: RecommendedSong(title: 'Vogue', artist: 'Madonna'),
    imagePath: AppAssets.post3,
    product: Product(
      name: 'WonderLash Mascara',
      imagePath: AppAssets.post3,
      price: 29.99,
      discountPercentage: 15,
      trendingMessage: 'High-converting in Oriflame Community',
      productLink: 'www.oriflame.com/giordani/amanda3012',
    ),
    referralCode: 'UK-AMANDA3012',
    referralLink: 'www.oriflame.com/giordani/amanda3012',
  ),
];
