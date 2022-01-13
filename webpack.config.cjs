const path = require("path");
const nodeExternals = require("webpack-node-externals");

const relative = path.join.bind(null, __dirname);

module.exports = {
    mode: "development",
    devtool: "inline-source-map",
    target: "node",
    externalsPresets: { node: true },
    externals: [nodeExternals()],
    experiments: {
        topLevelAwait: true,
    },
    entry: "./src/index.ts",
    module: {
        rules: [
            {
                test: /\.ts$/,
                use: "ts-loader",
            },
        ],
    },
    resolve: {
        extensions: [ ".ts", ".js" ],
        alias: {
            "@": relative("src"),
        },
    },
    output: {
        filename: "bundle.cjs",
        path: relative("out"),
    },
};
