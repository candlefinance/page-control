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
  color: string;
  style: ViewStyle;
};

const ComponentName = 'PageControlView';

export const PageControlView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<PageControlProps>(ComponentName)
    : () => {
        throw new Error(LINKING_ERROR);
      };
