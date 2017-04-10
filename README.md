# UIImage Picker Controller

## 概要
UIImagePickerControllerは、写真を撮影したり、保存した写真を選択するときに利用します。

## 関連クラス
Comparable、CutomStringComvertibleなど

## 主要プロパティ
|プロパティ|説明|サンプル|
|---|---|---|
| sourceType | 画像の取得先を指定する。<br>photoLibrary/camera/savedPhotosAlbum | imagePickerController.sourceType = .photoLibrary| 
| allowsEditing  |  取得した画像を編集するかどうかの指定する |  imagePickerController.allowsEditing = true |
| delegate |  デリゲートを指定する。<br> UIImagePickerControllerDelegateの実装用 |  imagePickerController.delegate = self |

##UIImagePickerControllerDelegateのメソッド
|メソッド|説明|必須|
|---|---|---|
| didFinishPickingMediaWithInfo | フォトギャラリーから写真を選択したとき | - | 
| imagePickerControllerDidCancel | キャンセルボタンを押下したとき |  - |

## フレームワーク
UIKit.framework

## サポートOSバージョン
iOS2.0以上

## 開発環境
|category | Version| 
|---|---|
| Swift | 3.0.2 |
| XCode | 8.3 |
| iOS | 10.2〜 |

## 参考
https://developer.apple.com/reference/uikit/uiimagepickercontroller
