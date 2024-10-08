const path = require("path");

// set up for development only so far.

// need to add css/module.css handling.

module.exports = {
  entry: "./src/index.js",
  mode: "development",
  output: {
    path: path.resolve(__dirname, "public"),
    filename: "build.js",
  },
  target: "web",
  devServer: {
    port: "3000",
    static: ["./public"],
    open: true,
    hot: true,
    liveReload: true,
  },
  resolve: {
    extensions: [".js", ".jsx", ".json"],
  },

  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: "babel-loader",
      },
    ],
  },
};
