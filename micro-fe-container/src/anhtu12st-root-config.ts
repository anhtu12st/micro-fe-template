import { registerApplication, start, LifeCycles } from "single-spa";

registerApplication({
  name: "@single-spa/welcome",
  app: () =>
    System.import<LifeCycles>(
      "https://unpkg.com/single-spa-welcome/dist/single-spa-welcome.js"
    ),
  activeWhen: ["/welcome"],
});

registerApplication({
  name: "@anhtu12st/application",
  app: () =>
    System.import<LifeCycles>("@anhtu12st/application"),
  activeWhen: ["/"],
});

start({
  urlRerouteOnly: true,
});
