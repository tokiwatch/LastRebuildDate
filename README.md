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


