1. https://youtu.be/8SFsln4VyEk をmp4 をダウンロード
1. frame に分割

  ```bash
  $ mkdir -p data
  $ fmpeg -i SECCONWARS2015.mp4 -f image2 data/frame%d.jpg
  ```

1. QR コードが隠れているフレームを全部消す
1. QR コード復元

   ```
   $ convert data/frame1???.jpg -background none -compose lighten -flatten output.jpg
   ```
