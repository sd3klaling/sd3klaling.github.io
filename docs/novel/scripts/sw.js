// sw.js

self.addEventListener('install', event => {
    console.log('Service Worker terinstall');
    self.skipWaiting();
});

self.addEventListener('activate', event => {
    console.log('Service Worker aktif');
    event.waitUntil(self.clients.claim());
});

self.addEventListener('fetch', event => {
    // Memeriksa jika permintaan berasal dari domain yang ingin kita bypass
    event.respondWith(
        fetch(event.request)
            .then(response => {
                // Membuat respons baru dengan menambahkan header CORS
                const newHeaders = new Headers(response.headers);
                newHeaders.set('Access-Control-Allow-Origin', '*'); // Mengizinkan semua origin

                const newResponse = new Response(response.body, {
                    status: response.status,
                    statusText: response.statusText,
                    headers: newHeaders,
                });
                return newResponse;
            })
            .catch(error => {
                console.error('Fetch gagal di Service Worker:', error);
                return new Response('Fetch failed', { status: 500 });
            })
    );
});