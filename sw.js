// Service Worker — Rota Inteligente (Modo Offline)
const CACHE_NAME = 'rota-inteligente-v1';
const ASSETS_TO_CACHE = [
  './',
  './index.html',
  './dashboard.html',
  './motorista.html'
];

// Instalação do Service Worker e salvamento dos arquivos no cache
self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      console.log('[Service Worker] Guardando ficheiros no cache...');
      return cache.addAll(ASSETS_TO_CACHE);
    })
  );
});

// Interceptação das requisições para responder via cache quando estiver offline
self.addEventListener('fetch', (event) => {
  event.respondWith(
    caches.match(event.request).then((response) => {
      return response || fetch(event.request);
    })
  );
});
