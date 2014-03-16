# LastRebuildDate

## はじめに

このプラグインは、modifierで指定されたブログの再構築が最後に行なわれた日時を出力します。

## 使い方

テンプレートの中で下記のように指定してください。

出力フォーマットは、MovableTypeの「日付に関するテンプレートタグモディファイヤ」の仕様のうちformatにのみ対応しています。

テンプレートの中では下記のように記述します。

```
<mt:LastRebuildDate blog_id='3' format="%x%X">
```

## 注意事項

ファイルの更新が発生しないと、日付情報が格納されません。
再構築の日付を取りたいブログ上で記事を更新する等を行い、ファイルの書き出しを行ってください。


