'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"manifest.json": "5cf9c88d3b44a9593fd5c043a34107cc",
"index.html": "ab8dc82d3e9450d266f545262f66cf05",
"/": "ab8dc82d3e9450d266f545262f66cf05",
"assets/AssetManifest.bin": "500f640e8332c59c1bc514da297fd800",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/assets/images/decorations/crystals/Red_crystal1.png": "18338b962391780889703dd2658a2ab2",
"assets/assets/images/decorations/crystals/Violet_crystal1.png": "4cba32e9af4e3556fbece62a454e51e6",
"assets/assets/images/decorations/crystals/Yellow_crystal1.png": "a004dfaac615318d56ae742b510a8984",
"assets/assets/images/decorations/crystals/Pink_crystal1.png": "54dfc445ffd4136b5374453b29f5696b",
"assets/assets/images/decorations/crystals/Green_crystal1.png": "72644e365c95f6bde10f6864dcf105ab",
"assets/assets/images/decorations/crystals/Black_crystal1.png": "8027f5b008811a95283ab93c595a52ca",
"assets/assets/images/decorations/crystals/Yellow-green_crystal1.png": "7af1d6f7587596c93bc2ef2e43b0e89a",
"assets/assets/images/decorations/crystals/White_crystal1.png": "c739fe8a9dcc324ff7b8782b5472113b",
"assets/assets/images/decorations/crystals/Blue_crystal1.png": "5d1aa2b6e3d96ba7ffc0dc6d0814e613",
"assets/assets/images/decorations/crystals/Dark_red_%2520crystal2.png": "c3ead2fa60b53e0071f22784635ed9bf",
"assets/assets/images/decorations/brands/github.png": "d7a4dff7bc1707e2a56130c3116a39dd",
"assets/assets/images/decorations/brands/instagram.png": "ad75d9749a43b7870d33f6028d512545",
"assets/assets/images/decorations/brands/io.png": "e9cc93a9bc9502a8dd01a795f203c6b4",
"assets/assets/images/decorations/brands/leetcode.png": "16d977c288526caed239ccd90471dcd6",
"assets/assets/images/decorations/brands/hackerrank.png": "96719a0c1c82daa29fe9e1152f5ddf3f",
"assets/assets/images/decorations/brands/linkedin.png": "c934c49a0dc36204791f9e82e96e538d",
"assets/assets/images/joystick_attack.png": "0f5325cb2ddcba703e4c9d7d2dd266df",
"assets/assets/images/joystick_knob.png": "bb0811554c35e7d74df6d80fb5ff5cd5",
"assets/assets/images/dungeon.tmj": "e7ee75f4acd97cbd7ea7e9e0140b680b",
"assets/assets/images/joystick_attack_range.png": "8994f23fc67442c8361432f0cc9a2fa1",
"assets/assets/images/npc/goblin/goblin_run_left.png": "05863189b562610b17a062114c7849a9",
"assets/assets/images/npc/goblin/goblin_run_right.png": "565c2f9a0bb01a9c56975664f8cd375c",
"assets/assets/images/npc/goblin/attack_effect_right.png": "15831f9ccee22a845e854ccb3d18f6e5",
"assets/assets/images/npc/goblin/goblin_idle.png": "8c97e935786b994c3cff4008212381b9",
"assets/assets/images/npc/goblin/goblin_idle_left.png": "a7563675f85ed259b2d0aae50ded196b",
"assets/assets/images/npc/ghost/summonDeath.png": "a14d5c45804ff0c1880584e3dd4d5b4c",
"assets/assets/images/npc/ghost/summonAppear.png": "9bc212ae967ba7df556c799b5235065e",
"assets/assets/images/npc/ghost/skill1.png": "e4ec6b69db2295204d52827b59e811bb",
"assets/assets/images/npc/ghost/idle.png": "d35bdb485ec8668413ba174ae8845047",
"assets/assets/images/npc/ghost/idle2.png": "da17ee3b190cd0847f819bdb1ebc8f2d",
"assets/assets/images/npc/ghost/attacking.png": "316b80e0adbb0ed581e0d229b7a8c9d4",
"assets/assets/images/npc/ghost/summon.png": "b9245e656990d06b4bc965716502893a",
"assets/assets/images/npc/ghost/summonIdle.png": "e667179068ac0c29fbffc907f7155537",
"assets/assets/images/npc/ghost/death.png": "135c24689060f7cb069f4758500b3446",
"assets/assets/images/npc/wizard/run_right.png": "a1573f064178cf002b3a4b0654cf36a6",
"assets/assets/images/npc/wizard/idle_left.png": "73cfd99c062be6065f3948c27a34138d",
"assets/assets/images/npc/wizard/Take%2520hit.png": "34c37e887cf62b61bb8cdf7ef3701373",
"assets/assets/images/npc/wizard/Fall.png": "af51967f0ddc558ca96498822a3667a5",
"assets/assets/images/npc/wizard/Jump.png": "8c0ede35d50cae44b497d8410002c736",
"assets/assets/images/npc/wizard/Attack1.png": "6b86deaa44166683828cb267aedd6595",
"assets/assets/images/npc/wizard/idle_right.png": "a3e645db92285003b59f6f282e1b2eea",
"assets/assets/images/npc/wizard/Death.png": "30ce0e0008f281cbacaba8315f1f4ad6",
"assets/assets/images/npc/wizard/Attack2.png": "6f637de9005bed9d4225651d77b55142",
"assets/assets/images/player/emote_exclamacao.png": "8b1897ae92f3a077e0aadaef2626d65a",
"assets/assets/images/Texture/Rock_statue_head_ground_shadow.png": "08e8175afbfe37e4879e4a72b93fa117",
"assets/assets/images/Texture/TX%2520Tileset%2520Stone%2520Ground.png": "bbac5b440b338d9acd3e1177576cba7d",
"assets/assets/images/Texture/Dragon_bones_body_ground_shadow.png": "077ebb5d8c635b3d2218f9cb1d4700d9",
"assets/assets/images/Texture/TX%2520Shadow.png": "8cecc375ec1467f48f8f03c87e85455b",
"assets/assets/images/Texture/Dragon_bones_full_ground_shadow.png": "5cab786e4da862a628623b65b7825538",
"assets/assets/images/Texture/Dragon_bones_wing1_ground_shadow.png": "26a4832bd8762040b4e452579cd8a327",
"assets/assets/images/Texture/TX%2520Shadow%2520Plant.png": "4ad7f68500d8ef1dd277cfde275628fe",
"assets/assets/images/Texture/TX%2520Plant.png": "e88857e4976724cdae95fff5de17230b",
"assets/assets/images/Texture/TX%2520Tileset%2520Grass.png": "77f818bca3533527aa7e882d5127e8e4",
"assets/assets/images/Texture/TX%2520Struct.png": "83a6fa0826c9fbe9b04b2a618c671aee",
"assets/assets/images/Texture/Rock_statue_deer_ground_shadow.png": "f82a3f49f2dcd5d0aad78097087b7137",
"assets/assets/images/Texture/Rock_statue_mother_ground_shadow.png": "c816dbd2455dbeb8f0b7492e34246dc0",
"assets/assets/images/Texture/Cave_entrance1_ground_shadow.png": "534fe441d5eb6625241c6dbbe1709741",
"assets/assets/images/Texture/Rock_statue_old_man_ground_shadow.png": "d58bf577b29bfdbf01852de8748b66be",
"assets/assets/images/Texture/Rock_statue_fox_ground_shadow.png": "fb5275c1e6916aed99042ae2e3040d27",
"assets/assets/images/Texture/Dragon_bones_wing2_ground_shadow.png": "31975f733b2bc05cd4940cff9d3deb7b",
"assets/assets/images/Texture/TX%2520Player.png": "36628d1c77deae829e75014be971bfa3",
"assets/assets/images/Texture/TX%2520Tileset%2520Wall.png": "864f72fdb0f5498b9f4c0de0f216c6dc",
"assets/assets/images/Texture/TX%2520Props.png": "b0248691751471faa5629ccf23e446e8",
"assets/assets/images/joystick_background.png": "8c9aa78348b48e03f06bb97f74b819c9",
"assets/assets/images/smoke_explosion.png": "555a8a42b72e662af232dc2092103c2a",
"assets/assets/fonts/VT323-Regular.ttf": "034de38c65e202c1cc838e7d014385fd",
"assets/FontManifest.json": "f924e7e3c202f8616f860b01be1d7a7f",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/NOTICES": "0d9122a03f3194359dd8534a855dcfc5",
"assets/AssetManifest.json": "2b314bef5b2eff497d1e1e105693f302",
"main.dart.js": "e55bb6e3286edda7a8ad432706b45391",
"icon.png": "6c08d8ceca444b8a2e0383b6bb297919",
"version.json": "19d6a002335b5d00e046b5c744afb23b",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0"};
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
