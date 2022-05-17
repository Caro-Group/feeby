importScripts(
  'https://storage.googleapis.com/workbox-cdn/releases/6.4.1/workbox-sw.js',
)

workbox.precaching.precacheAndRoute([
  {
    url:
      'https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,400&subset=latin-ext&display=swap',
    revision: '1',
  },
])

workbox.routing.registerRoute(
  new RegExp('/themes/feeby/assets/cache/.*\\.js'),
  new workbox.strategies.CacheFirst({
    cacheName: 'js-compile-cache',
    plugins: [
      new workbox.expiration.ExpirationPlugin({
        maxEntries: 1,
      }),
    ],
  }),
)

workbox.routing.registerRoute(
  new RegExp('/themes/feeby/assets/cache/.*\\.css'),
  new workbox.strategies.CacheFirst({
    cacheName: 'css-compile-cache',
    plugins: [
      new workbox.expiration.ExpirationPlugin({
        maxEntries: 1,
      }),
    ],
  }),
)

workbox.routing.registerRoute(
  new RegExp('/themes/feeby/assets/cache/.*\\.(?:svg|gif)'),
  new workbox.strategies.CacheFirst({
    cacheName: 'micro-image-cache',
    plugins: [
      new workbox.expiration.ExpirationPlugin({
        maxEntries: 1,
      }),
    ],
  }),
)
