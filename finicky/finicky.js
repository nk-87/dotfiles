module.exports = {
  defaultBrowser: "Firefox Nightly",
  /*
  options: {
    logRequests: true,
  },*/
  handlers: [
    {
      match: ({ opener }) =>
        ["com.tinyspeck.slackmacgap", "com.amazonaws.acvc.osx", "us.zoom.xos"].includes(opener.bundleId),
      browser: "Firefox"
    },
    {
      match: [/github.com\/redpanda-data.*$/, "device.sso.*.amazonaws.com/*", "portal.sso.*.amazonaws.com/saml/assertion/*"],
      browser: "Firefox"
    },
  ]
}
