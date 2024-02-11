'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "f6e85d7b0565403642831c327828ef37",
"favicon.ico": "2e017881873b061e2beb55fe1ea5a9a8",
"index.html": "084ddf18fa09694b33fb12c0a0e66f61",
"/": "084ddf18fa09694b33fb12c0a0e66f61",
"main.dart.js": "bd9c3d24c4ce8f1a43b7cf86b013dccd",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/windows11/StoreLogo.scale-100.png": "412f127fb64108880a3ba1b79b6c3a31",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-40.png": "06c8b1873c36ba02a686ab812396fbc3",
"icons/windows11/Square44x44Logo.targetsize-20.png": "7fb51c4360e9620beda0f01c11846c8a",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-96.png": "f0ab332eee8fb06b5f77ce71162f376d",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-80.png": "2c131edf720793bfe2a4f0c327a8691c",
"icons/windows11/Square150x150Logo.scale-125.png": "57e86f174d22b46a4fcf44bdf71b0484",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-44.png": "2d52634bad06b34efa78718d2de7f493",
"icons/windows11/Square44x44Logo.targetsize-36.png": "8519ce83fa2ddc7c7a716cca5ac989c0",
"icons/windows11/SplashScreen.scale-400.png": "dc80ee751304f0094654d962f2e24d30",
"icons/windows11/Square44x44Logo.scale-125.png": "e76a1d1b319dbd3e325207cf9f09ad76",
"icons/windows11/Square44x44Logo.targetsize-32.png": "dbb30b251238165c9fa6ffb4609b039a",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-40.png": "06c8b1873c36ba02a686ab812396fbc3",
"icons/windows11/LargeTile.scale-100.png": "350640de853a121ef0b4c42be7d91ba6",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-96.png": "f0ab332eee8fb06b5f77ce71162f376d",
"icons/windows11/Wide310x150Logo.scale-125.png": "7f52834e34772be455e293323e5fff3f",
"icons/windows11/SmallTile.scale-100.png": "06c023dc64e4f0e79ed531d3441beb0e",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-80.png": "2c131edf720793bfe2a4f0c327a8691c",
"icons/windows11/Square44x44Logo.targetsize-30.png": "dfc916c095ed1fb7eff5680d7504a4d7",
"icons/windows11/Square44x44Logo.targetsize-24.png": "acb759ab4ab158de7b92f388c89c7d19",
"icons/windows11/SplashScreen.scale-200.png": "a98a2a1f890ea1e92d32a1cfa9202165",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-44.png": "2d52634bad06b34efa78718d2de7f493",
"icons/windows11/Square44x44Logo.scale-150.png": "d255b06e8dd4bc07e4eacba261aeb032",
"icons/windows11/Square44x44Logo.targetsize-80.png": "2c131edf720793bfe2a4f0c327a8691c",
"icons/windows11/LargeTile.scale-400.png": "13c7abc0a1d63d2b0727a13cfcf5f6f1",
"icons/windows11/Square150x150Logo.scale-150.png": "fbaaa0ce34ceb0ec2cad0d9d63af399c",
"icons/windows11/StoreLogo.scale-200.png": "98e921d4c26616d5158a222fde2ca301",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-30.png": "dfc916c095ed1fb7eff5680d7504a4d7",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-24.png": "acb759ab4ab158de7b92f388c89c7d19",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-36.png": "8519ce83fa2ddc7c7a716cca5ac989c0",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-20.png": "7fb51c4360e9620beda0f01c11846c8a",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-32.png": "dbb30b251238165c9fa6ffb4609b039a",
"icons/windows11/Square44x44Logo.targetsize-40.png": "06c8b1873c36ba02a686ab812396fbc3",
"icons/windows11/Square44x44Logo.targetsize-96.png": "f0ab332eee8fb06b5f77ce71162f376d",
"icons/windows11/SmallTile.scale-400.png": "33f142ad1d9ee3b4618e2cda64b6bd1a",
"icons/windows11/LargeTile.scale-200.png": "d2d53c2dabd2d7c1b3f4e9b04c8bbfc9",
"icons/windows11/Square44x44Logo.targetsize-44.png": "2d52634bad06b34efa78718d2de7f493",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-36.png": "8519ce83fa2ddc7c7a716cca5ac989c0",
"icons/windows11/Wide310x150Logo.scale-150.png": "7faed5bb0faf4e97f9ef17de1e53c46f",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-30.png": "dfc916c095ed1fb7eff5680d7504a4d7",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-24.png": "acb759ab4ab158de7b92f388c89c7d19",
"icons/windows11/StoreLogo.scale-400.png": "49a839a6e246537d4530d55dd84208dc",
"icons/windows11/SplashScreen.scale-100.png": "d5e2dabd8054eab85ded34da89117983",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-32.png": "dbb30b251238165c9fa6ffb4609b039a",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-20.png": "7fb51c4360e9620beda0f01c11846c8a",
"icons/windows11/SmallTile.scale-200.png": "2e2d0e8a899cf971a2a316026886ed1d",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-16.png": "6f88a0c613e95a21a7c2f9aa8f880580",
"icons/windows11/Square150x150Logo.scale-400.png": "e8013d283506663beabae0dd35e31a0a",
"icons/windows11/Wide310x150Logo.scale-200.png": "d5e2dabd8054eab85ded34da89117983",
"icons/windows11/LargeTile.scale-150.png": "69170107e99dc2b5a8ac22c3642d54f6",
"icons/windows11/Square44x44Logo.scale-400.png": "79e44b751b51e5267c4a9f3eacc82503",
"icons/windows11/SplashScreen.scale-125.png": "6d6a119d9ac78b840f50a86b4164e4cc",
"icons/windows11/SmallTile.scale-150.png": "0026986eb94d4ebf7766d3724b6d18a6",
"icons/windows11/Square44x44Logo.targetsize-48.png": "b0622c759108a08818e6f3dba46e05c5",
"icons/windows11/Square44x44Logo.targetsize-60.png": "52f1defe51298f28c330cb2846c6b352",
"icons/windows11/Wide310x150Logo.scale-400.png": "a98a2a1f890ea1e92d32a1cfa9202165",
"icons/windows11/StoreLogo.scale-150.png": "9c4fe595c8cb43570a0fb9e393426c3c",
"icons/windows11/Square150x150Logo.scale-200.png": "57c078f74bb6f864f28f5e7d165fb4ba",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-16.png": "6f88a0c613e95a21a7c2f9aa8f880580",
"icons/windows11/Square44x44Logo.targetsize-64.png": "dde5625434967245e798c5e682ff872f",
"icons/windows11/Square44x44Logo.scale-200.png": "2f78c9422a4fff8e053fadac2b31e776",
"icons/windows11/Square44x44Logo.targetsize-256.png": "daf8bd3b3473b4a2f3bb13ad83f96cc6",
"icons/windows11/Square44x44Logo.targetsize-72.png": "48c9bc72e70d2e616fa4371de505c82a",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-72.png": "48c9bc72e70d2e616fa4371de505c82a",
"icons/windows11/SmallTile.scale-125.png": "d6b1f77c1754b6d8261a12057e302e60",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-60.png": "52f1defe51298f28c330cb2846c6b352",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-48.png": "b0622c759108a08818e6f3dba46e05c5",
"icons/windows11/Wide310x150Logo.scale-100.png": "d3f7461155171a21a4f91367ba83bfdd",
"icons/windows11/SplashScreen.scale-150.png": "4e18d0742f14438594f37a5dd6f56026",
"icons/windows11/Square44x44Logo.targetsize-16.png": "6f88a0c613e95a21a7c2f9aa8f880580",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-64.png": "dde5625434967245e798c5e682ff872f",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-256.png": "daf8bd3b3473b4a2f3bb13ad83f96cc6",
"icons/windows11/LargeTile.scale-125.png": "17e02737be2c44cd3274ce2639cdbd76",
"icons/windows11/Square44x44Logo.scale-100.png": "2d52634bad06b34efa78718d2de7f493",
"icons/windows11/Square150x150Logo.scale-100.png": "468b12c342800ce3e4a3df648d08718e",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-60.png": "52f1defe51298f28c330cb2846c6b352",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-48.png": "b0622c759108a08818e6f3dba46e05c5",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-72.png": "48c9bc72e70d2e616fa4371de505c82a",
"icons/windows11/Square44x44Logo.altform-unplated_targetsize-64.png": "dde5625434967245e798c5e682ff872f",
"icons/windows11/Square44x44Logo.altform-lightunplated_targetsize-256.png": "daf8bd3b3473b4a2f3bb13ad83f96cc6",
"icons/windows11/StoreLogo.scale-125.png": "4dcb5a8b5ca19ecf6ff93a34cf707563",
"icons/apple_touch/favicon.ico": "2e017881873b061e2beb55fe1ea5a9a8",
"icons/apple_touch/apple-touch-icon-120x120.png": "1b139a5ce7a18d5b29ffe46b63d7e318",
"icons/apple_touch/apple-touch-icon.png": "21d1e6c2d7e8a8bdc2159f3ce4b7b972",
"icons/apple_touch/apple-touch-icon-152x152.png": "7b9c58d332977ce6ab508e1d75fa577a",
"icons/apple_touch/apple-touch-icon-180x180.png": "be8f8ed37a6a0a375b491962c2123825",
"icons/apple_touch/apple-touch-icon-114x114.png": "ec1a70e2e1a92ec45bb420ce1106f474",
"icons/apple_touch/apple-touch-icon-76x76.png": "88eaf7783c1a6c8aba6b1e8e586c7d41",
"icons/apple_touch/apple-touch-icon-57x57.png": "21d1e6c2d7e8a8bdc2159f3ce4b7b972",
"icons/apple_touch/apple-touch-icon-72x72.png": "1d589b1a798c2699d28f7766013ed500",
"icons/apple_touch/apple-touch-icon-144x144.png": "9982e24957f135f626ba024920d8ca16",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/ios/1024.png": "729d57bc6919784e70241e780f4faebf",
"icons/ios/76.png": "0d101409ad6c46606d1f5aa8ab61528f",
"icons/ios/60.png": "5128de37f7bf52be1c3b5fa78e45fdae",
"icons/ios/64.png": "82a07982b2781acd1fddfc13736cf70a",
"icons/ios/58.png": "b40b101a3930c8e07bcd7dbe4aaee387",
"icons/ios/167.png": "c2211a9dc33e329f5c487269a18d1ea8",
"icons/ios/72.png": "871ff10778c04d177b54199df999ab6a",
"icons/ios/29.png": "efd5520240cbfdd154a52e94d32b717f",
"icons/ios/100.png": "98e921d4c26616d5158a222fde2ca301",
"icons/ios/114.png": "ea5d1a437d07360e8800bcb534d3e6f1",
"icons/ios/128.png": "ccbdeacd7260e9768f08cc172db18c76",
"icons/ios/512.png": "f27da8c5102cc6a283f8cd1be735cbe8",
"icons/ios/16.png": "5f808e6943b0c7d81b656e5df486c53a",
"icons/ios/120.png": "03d10216da4090862ca9e3e354a412cc",
"icons/ios/256.png": "8d220a2a73a3ab1100d2ba3d8de7e498",
"icons/ios/20.png": "09ac6d03055a04191325289fa2208297",
"icons/ios/32.png": "4b8b5971564aec1bc8ea48e9c401eff7",
"icons/ios/180.png": "c21c8460ef2bd731e0c55e0e30f4a4f2",
"icons/ios/57.png": "2d7391f3dc9e9563215d7f625f796751",
"icons/ios/80.png": "49362288291c8d9aada17d4490e522ae",
"icons/ios/40.png": "06f33daf5ff51a24be62c82592ded403",
"icons/ios/87.png": "a412984518d868877966060a59d5a6ab",
"icons/ios/192.png": "aa0fc4b0510a6ec79700320cea93b0bf",
"icons/ios/50.png": "412f127fb64108880a3ba1b79b6c3a31",
"icons/ios/144.png": "662d7da4d4eac0688e6c64f319391359",
"icons/ios/152.png": "985ea51b1be0209b700a283bed841930",
"icons/android/android-launchericon-512-512.png": "f27da8c5102cc6a283f8cd1be735cbe8",
"icons/android/android-launchericon-144-144.png": "662d7da4d4eac0688e6c64f319391359",
"icons/android/android-launchericon-48-48.png": "56dc6bd43a8c8ef3983048586c19482f",
"icons/android/android-launchericon-192-192.png": "aa0fc4b0510a6ec79700320cea93b0bf",
"icons/android/android-launchericon-96-96.png": "99d1f400d05af2ebe1a4ed05aba03e39",
"icons/android/android-launchericon-72-72.png": "871ff10778c04d177b54199df999ab6a",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "84432ab3bc184408b3b7c44fe448ab9f",
"assets/AssetManifest.json": "fbe75fbaae4ae8a66e6c5159a70721b1",
"assets/NOTICES": "ff5ae0a61248b5fa75e952810de6e552",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "9d36591a5d33944b9ff04757015e64cd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "75d4d7c9372dfa3070f4a5552ebc4c2b",
"assets/fonts/MaterialIcons-Regular.otf": "dd22a789ab2f85ba64c70c327f946ef8",
"assets/assets/images/concentration.svg": "a39c708cbf2b684126a8ae32e899b425",
"assets/assets/images/map_6x8.png": "45e4717fc19fcffb719345ffcd125b91",
"assets/assets/images/retro.svg": "6911dc27996fa444e54ee7252cf79f91",
"assets/assets/images/concentration/10.svg": "3ecad5867b958b82217cab5e6b4e4580",
"assets/assets/images/concentration/11.svg": "d3f7649cf58426d44174d6f158d79f32",
"assets/assets/images/concentration/13.svg": "a3ccf1e5203c53fc8ea3962477b86f24",
"assets/assets/images/concentration/12.svg": "d3d4128e35b3401436192cb95fa05f42",
"assets/assets/images/concentration/16.svg": "d5c8ca1886debc49ebfb8a2d78abcc15",
"assets/assets/images/concentration/17.svg": "b53f17dee76af2d314f796b8e6a75748",
"assets/assets/images/concentration/15.svg": "62ada8ebf192003a63a3ebea551fe22f",
"assets/assets/images/concentration/14.svg": "d072010332a8567642e916d1ada9ae85",
"assets/assets/images/concentration/9.svg": "1d178e9380a10d6cfa92876232918204",
"assets/assets/images/concentration/8.svg": "f9a884af70f70f610980d41c772294e0",
"assets/assets/images/concentration/0.svg": "081e17afe5e465c347857ad92f82e711",
"assets/assets/images/concentration/1.svg": "4e0289e23a7ccd56f27b54012a3b58fe",
"assets/assets/images/concentration/3.svg": "6f604226f1790cbafb94f04bb5a6a327",
"assets/assets/images/concentration/2.svg": "0647612df6971a6c1193ebd119925e29",
"assets/assets/images/concentration/6.svg": "a6f08750a2b854c029eac4581545f42c",
"assets/assets/images/concentration/7.svg": "b3c1bc7129e3e2a297551e7e3ab13ceb",
"assets/assets/images/concentration/5.svg": "9e97fde3cc675bc9ca5b56102d9c34e1",
"assets/assets/images/concentration/4.svg": "481ac9213d24313957a6a82e635be109",
"assets/assets/images/concentration/19.svg": "be8d7c33098afd1fee871e290068586b",
"assets/assets/images/concentration/18.svg": "e81e7f6269ed54271855ee04be60b631",
"assets/assets/images/concentration/23.svg": "79ade44c5d9b5ec1e69cff8689afcfeb",
"assets/assets/images/concentration/22.svg": "c7ddacd764d089028a79e1bc58ac5ee3",
"assets/assets/images/concentration/20.svg": "ba14873c791ac9afa347b851fd01b693",
"assets/assets/images/concentration/21.svg": "c81f4cbef68c0b2ef3b8485ef6fedc4b",
"assets/assets/images/map_4x4.png": "4c264209a2264155f7b744bfe43bfdf4",
"assets/assets/images/retro/10.svg": "f299ec09ee74b673399d24fb91b2f8a0",
"assets/assets/images/retro/11.svg": "9b914e536eb09fd8c5a76bca0abc8500",
"assets/assets/images/retro/13.svg": "47c800e3e27d006747c723bfe75fea8b",
"assets/assets/images/retro/12.svg": "1750f52b980d342cedf3b87ca2e11c26",
"assets/assets/images/retro/16.svg": "41cc51e05293f023e96ab6fe1a1cf9c7",
"assets/assets/images/retro/17.svg": "8507c789ff71f92f701d6536e2d2f2d0",
"assets/assets/images/retro/15.svg": "51c118836a9813a14279d00753dd7ed9",
"assets/assets/images/retro/14.svg": "286510b5e412bf3003b6231e9869688b",
"assets/assets/images/retro/9.svg": "a3570c673b2620138df1970d3cfbe2d0",
"assets/assets/images/retro/8.svg": "8fd55cfca009ebae9b1dd87f9a200de8",
"assets/assets/images/retro/0.svg": "cf9f3d852852ac0ec5678d09dedabee5",
"assets/assets/images/retro/1.svg": "421ab42307ee2f5fc20941484c357de7",
"assets/assets/images/retro/3.svg": "db682286e5e79e14a50f8ec248940ae5",
"assets/assets/images/retro/2.svg": "65778c3772c6b0cd4efea0f951641a01",
"assets/assets/images/retro/6.svg": "70f6c65a23e6cc3c6231339466c6e80d",
"assets/assets/images/retro/7.svg": "f121b1730c0f78326ef6016530debdb5",
"assets/assets/images/retro/5.svg": "6503e1707b852b499cc0bba1917583e5",
"assets/assets/images/retro/4.svg": "1c58bd2055907ca4835f53b9882ce73d",
"assets/assets/images/retro/19.svg": "966abee1455faa6c7f19038e293ef004",
"assets/assets/images/retro/18.svg": "eed84d3628f22cb82dc0f958e35ded64",
"assets/assets/images/retro/23.svg": "eb3c1112f2eb09d04b631590abb28ae1",
"assets/assets/images/retro/22.svg": "c32da5540a793af29cc170b2f3431521",
"assets/assets/images/retro/20.svg": "f6427dd4111babbba2ae74b66be22baa",
"assets/assets/images/retro/21.svg": "991b4969c10169140e0205979e24beac",
"assets/assets/images/olive_blue.svg": "090783e9254ba89c136b936a7a1d1998",
"assets/assets/images/olive/10.svg": "1ce5dc3fc104e4aea91a3349d36dd3c0",
"assets/assets/images/olive/11.svg": "5fb8caa6551f12c9d87bf59f6f4de7c8",
"assets/assets/images/olive/13.svg": "7a91385d0e3498eb568254673ff46f61",
"assets/assets/images/olive/12.svg": "ae4a9b62737fd3e7b8ad2d2bf83a7cdc",
"assets/assets/images/olive/16.svg": "029bcf70439fd269b5478a3d2648cfcd",
"assets/assets/images/olive/17.svg": "6504e276bcaef9e711e4a876c80836f7",
"assets/assets/images/olive/15.svg": "b2b11fbebae8a005dc884fdde3bc2a27",
"assets/assets/images/olive/14.svg": "0453c39ca716af56de6ced82c937564f",
"assets/assets/images/olive/9.svg": "372a7d767b213622ff164f2b96aad601",
"assets/assets/images/olive/8.svg": "80719bb267846a3c4b530116455f12d2",
"assets/assets/images/olive/0.svg": "4b6225d93d7f71862af7bcfd17364165",
"assets/assets/images/olive/1.svg": "b7344b60c95d36485e87977e4125b6a7",
"assets/assets/images/olive/3.svg": "63b8edb0b50f4ac67cb60d07ecb33e0c",
"assets/assets/images/olive/2.svg": "750fdcfe5e5c2c1e9bf8ebb0b556544b",
"assets/assets/images/olive/6.svg": "efb8ecf95d08ed1b9141995ab291375e",
"assets/assets/images/olive/7.svg": "a722870888a83c4968a2cf022e679d07",
"assets/assets/images/olive/5.svg": "a6c580ed47e0c3183fd8b6c301fcab01",
"assets/assets/images/olive/4.svg": "98ea6d75f5d1b6966d2ca86cd10c23d7",
"assets/assets/images/olive/19.svg": "93f974717f5e2a9527d30b23317a81cc",
"assets/assets/images/olive/18.svg": "5c7fcff6c3873884082add57c475c48a",
"assets/assets/images/olive/23.svg": "826953126a49ad441dd723e38bb59a40",
"assets/assets/images/olive/22.svg": "6e6b76e2462035d44dd26feeefd2abd4",
"assets/assets/images/olive/20.svg": "50d3085801634fd89382717d9eae93fc",
"assets/assets/images/olive/21.svg": "76f5645b7f7be20f3bf87aae30789257",
"assets/assets/images/map_5x6.png": "aae9142c35473d03e6bf2556a4283ba1",
"assets/assets/images/olive.svg": "430e88887b442dc1dabc1fc566b1a830",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
