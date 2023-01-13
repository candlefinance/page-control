import * as React from 'react';

import { Pressable, StyleSheet, Text, View } from 'react-native';
import { PageControlView } from '@candlefinance/page-control';

export default function App() {
  const [currentPage, setCurrentPage] = React.useState(5);
  const pages = 20;
  return (
    <View style={styles.container}>
      <Text>Current page: {currentPage}</Text>
      <PageControlView
        currentPage={currentPage}
        hidesForSinglePage
        numberOfPages={pages}
        onPageChange={(event) => setCurrentPage(event.nativeEvent.currentPage)}
        style={styles.box}
      />
      <Pressable onPress={() => setCurrentPage((currentPage + 1) % pages)}>
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
    backgroundColor: '#ecf0f1',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
