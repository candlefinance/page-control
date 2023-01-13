
[![npm version](https://badge.fury.io/js/@candlefinance%2Fpage-control.svg)](https://badge.fury.io/js/@candlefinance%2Fpage-control)

# Page Control

[UIPageControl](https://developer.apple.com/documentation/uikit/uipagecontrol) wrapper for react native.

# Demo

[![Watch the video](https://user-images.githubusercontent.com/12258850/212359063-127f7909-2a15-49ba-a153-e77f4fe11842.png)](https://user-images.githubusercontent.com/12258850/212358595-85b8ec16-749d-4ac4-9b2b-bdd53ad23fed.mp4)

## Installation

```sh
npm install @candlefinance/page-control

yarn install @candlefinance/page-control
```

## Usage

```js
import { PageControlView } from "@candlefinance/page-control";

const [currentPage, setCurrentPage] = React.useState(0);

// ...
<PageControlView
  currentPage={currentPage}
  hidesForSinglePage
  numberOfPages={8}
  onPageChange={(event) => setCurrentPage(event.nativeEvent.currentPage)}
  currentPageIndicatorTintColor="#ff0067"
  pageIndicatorTintColor="#D3D3D3"
  style={styles.box}
/>

```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
