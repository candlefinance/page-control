import {
  requireNativeComponent,
  UIManager,
  Platform,
  ViewStyle,
} from 'react-native';

const LINKING_ERROR =
  `The package '@candlefinance/page-control' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

type PageControlProps = {
  currentPage: number;
  numberOfPages: number;
  hidesForSinglePage?: boolean;
  pageIndicatorTintColor?: string;
  currentPageIndicatorTintColor?: string;
  onPageChange: (event: { nativeEvent: { currentPage: number } }) => void;
  style: ViewStyle;
};

const ComponentName = 'PageControlView';

export const PageControlView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<PageControlProps>(ComponentName)
    : () => {
        throw new Error(LINKING_ERROR);
      };
