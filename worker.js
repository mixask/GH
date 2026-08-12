export default {
  async fetch(request) {
    const url = new URL(request.url);

    if (url.pathname === "/script.lua") {
      return new Response('print("test")', {
        headers: {
          "Content-Type": "text/plain; charset=utf-8"
        }
      });
    }

    return new Response("Not Found", { status: 404 });
  }
};
