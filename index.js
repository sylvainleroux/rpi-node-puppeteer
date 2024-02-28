const puppeteer = require("puppeteer");
const fs = require("fs");
(async () => {
  const browser = await puppeteer.launch({
    executablePath: "/usr/bin/chromium",
    args: ['--no-sandbox', '--disable-setuid-sandbox' ],
  });

  const page = await browser.newPage();
  await page.goto("https://www.google.com");

  // Get the "viewport" of the page, as reported by the page.
  const data = await page.evaluate(() => {
    return {
      pageTitle: document.title,
    };
  });

  data.nodeVersion = process.version;
  data.puppeteerVersion = require("puppeteer/package.json").version;
  data.browserVersion = await browser.version();
  console.log(JSON.stringify(data,null,2));

  await browser.close();

  process.exit((data.pageTitle !== "Google" && 1) || 0);
})();
