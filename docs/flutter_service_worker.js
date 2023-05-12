'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "219554c6d29063772251e6a974ab97bb",
"index.html": "4695bb1cf8d4a376a159ae9ad38905da",
"/": "4695bb1cf8d4a376a159ae9ad38905da",
"main.dart.js": "f0c8e979f80033763df6fd0a33c5cfb0",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "c22147f68eced43f34134f5324628edd",
"assets/AssetManifest.json": "fbe75fbaae4ae8a66e6c5159a70721b1",
"assets/NOTICES": "d8b9f926a99308f253e1853b1f3dbc5b",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "09904d6bc08c4d33c91d31b1da7d1339",
"assets/fonts/MaterialIcons-Regular.otf": "cf0c6696cab2c496a363aa25ee8b67cc",
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
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a"};
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
