import * as React from 'react';

import { Pressable, StyleSheet, Text, View } from 'react-native';
import { PageControlView } from '@candlefinance/page-control';

export default function App() {
  const [currentPage, setCurrentPage] = React.useState(5);
  return (
    <View style={styles.container}>
      <Text>Current page: {currentPage}</Text>
      <PageControlView
        currentPage={currentPage}
        hidesForSinglePage
        numberOfPages={8}
        onPageChange={(event) => setCurrentPage(event.nativeEvent.currentPage)}
        currentPageIndicatorTintColor="#FF6347"
        pageIndicatorTintColor="#D3D3D3"
        style={styles.box}
      />
      <Pressable onPress={() => setCurrentPage((currentPage + 1) % 8)}>
        <Text>Press me</Text>
      </Pressable>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
