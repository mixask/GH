export default {
  async fetch(request) {
    const url = new URL(request.url);
    const headers = {
      "Content-Type": "text/plain; charset=utf-8",
      "Cache-Control": "no-cache",
    };

    if (url.pathname === "/script.lua") {
      const response = await fetch(
        "https://raw.githubusercontent.com/mixask/GH/main/greedy.lua"
      );
      return new Response(await response.text(), { headers });
    }

    if (url.pathname === "/library.lua") {
      const response = await fetch(
        "https://raw.githubusercontent.com/mixask/GH/main/greedylibrary.lua"
      );
      return new Response(await response.text(), { headers });
    }

    if (url.pathname === "/loader.lua") {
      const response = await fetch(
        "https://raw.githubusercontent.com/mixask/GH/main/greedyloader.lua"
      );
      if (!response.ok) {
        return new Response("Loader file not found", { status: 404 });
      }
      return new Response(await response.text(), { headers });
    }

    if (url.pathname === "/modules.lua") {
      const response = await fetch(
        "https://raw.githubusercontent.com/mixask/GH/main/greedymodules.lua"
      );
      if (!response.ok) {
        return new Response("Modules file not found", { status: 404 });
      }
      return new Response(await response.text(), { headers });
    }

    return new Response("Not Found", { status: 404 });
  },
};
