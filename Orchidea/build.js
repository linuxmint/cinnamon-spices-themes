
const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const SRC_PATH = './src';
const OUT_PATH = './files';
const REGEX = /.*cinnamon-(.+)-(.+)\.scss/;

const files = fs.readdirSync(SRC_PATH);

const themeFiles = [];

for (let i = 0; i < files.length; i++) {
  const file = files[i];

  if (fs.statSync(path.join(SRC_PATH, file)).isFile()) {

    const match = file.match(REGEX);

    if (match) {
      const color = match[1];
      const variant = match[2];

      themeFiles.push({
        color,
        variant,
        srcSass: path.join(SRC_PATH, file),
        outPath: path.join(OUT_PATH, `Orchidea-${capitalizeFirstLetter(color)}-${capitalizeFirstLetter(variant)}`, 'cinnamon'),
        outCss: path.join(OUT_PATH, `Orchidea-${capitalizeFirstLetter(color)}-${capitalizeFirstLetter(variant)}`, 'cinnamon', 'cinnamon.css')
      });

    }
  }

}

// Clean out path
fs.rmSync(OUT_PATH, { recursive: true });
fs.mkdirSync(OUT_PATH, { recursive: true });

themeFiles.forEach(data => {
  console.log(`Prepare theme ${data.color} ${data.variant}...`);
  fs.mkdirSync(data.outPath, { recursive: true });
  fs.mkdirSync(`${data.outPath}/assets`, { recursive: true });

  // Compile sass
  execSync(`sass ${data.srcSass} ${data.outCss} --no-source-map`);

  // Copy thumbnail
  const thumbnailFilePath = `${SRC_PATH}/screenshots/thumbnail-${data.variant}.png`;
  execSync(`cp ${thumbnailFilePath} ${data.outPath}/thumbnail.png`);

  // Copy assets
  // 1 Common
  execSync(`cp -r ${SRC_PATH}/assets/common-assets/* ${data.outPath}/assets`);
  // 2 Variant
  execSync(`cp -r ${SRC_PATH}/assets/${data.variant === 'dark' ? 'assets-dark' : 'assets'}/* ${data.outPath}/assets`);
  // 3 Theme
  execSync(`cp -r ${SRC_PATH}/assets/theme-${data.color}/* ${data.outPath}/assets`);

});


function capitalizeFirstLetter(text) {
  return `${text.charAt(0).toUpperCase()}${text.slice(1)}`;
}
