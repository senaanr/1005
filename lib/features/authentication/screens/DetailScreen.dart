import 'package:flutter/material.dart';
import '../../components/DetailContainer/detailContainer.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailContainer(
        imagePaths: [
          'https://ciceksarayi.com/wp-content/uploads/2023/05/bitki-nasil-budanir-bitki-budama-teknikleri.jpg',
          // Add more image URLs here
        ],
        videoPaths: [
          'lib/utils/animations/budama.mp4',
        ],
        youtubeUrls: [
          'https://www.youtube.com/watch?v=T7-xdDVno64&ab_channel=SalimKaraman%7C%C3%87iftlikOkulu',
          // Add more YouTube URLs here
        ],
        title: 'Budama',
        description:
        'Budama, bitkilerin çeşitli amaçlarla düzenli olarak kesilmesi veya şekillendirilmesi işlemidir. Bitki budaması, bahçe bakımının önemli bir parçasıdır ve çeşitli bitki türleri için farklı teknikler gerektirebilir. İşte budamanın genel amaçları ve bazı temel teknikleri:\n\n'
            'Budama, bitkinin sağlığını ve gücünü artırabilir. Ölü veya hastalıklı dalların kesilmesi, bitkinin genel sağlığını iyileştirebilir ve hastalık veya zararlı organizmaların yayılmasını önleyebilir.\n\n'
            'Budama, bitkinin istenilen şekle ve boyuta ulaşmasını sağlar. Özellikle süs bitkileri, ağaçlar ve çalılar için şekil verme amaçlı budama sıkça uygulanır.\n\n'
            'Doğru şekilde yapılan budama, meyve ağaçlarında veya çiçekli bitkilerde verimi artırabilir. Örneğin, meyve ağaçlarında yapılan budama, daha fazla meyve oluşumunu teşvik edebilir.\n\n'
            'Bahçe veya peyzaj düzenlemelerinde bitkilerin görünümünü iyileştirmek için budama önemlidir. Bitkilerin düzenli ve estetik bir şekilde kesilmesi, genel bahçe veya peyzajın güzelliğini artırabilir.\n\n'
            'Budama işlemi bitkinin türüne, yaşına ve büyüme alışkanlıklarına bağlı olarak değişir. Bazı bitkiler, düzenli olarak budanmalı ve şekillendirilmelidir, ancak bazıları için budama gereksiz veya zararlı olabilir. Bu nedenle, bitki türünüze ve bahçenizin özel ihtiyaçlarına uygun olarak budama tekniklerini öğrenmek önemlidir.',
      ),
    );
  }
}