export default {
  async fetch(request) {
    const url = new URL(request.url);

    if (url.pathname === "/script.lua") {
      const script = await fetch(
        "https://raw.githubusercontent.com/mixask/GH/main/script.lua"
      );

      return new Response(await script.text(), {
        headers: {
          "Content-Type": "text/plain; charset=utf-8",
          "Cache-Control": "no-cache"
        }
      });
    }

    return new Response("Not Found", { status: 404 });
  }
};
