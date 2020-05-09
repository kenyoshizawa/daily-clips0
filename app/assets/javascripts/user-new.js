// $(document).on('change', 'input[type="file"]', function() {
//   console.log('test');
//   var input = $(this);
//   numFiles = input.get(0).files ? input.get(0).files.length : 1;
//   label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
//   input.parent().parent().next(':text').val(label);
// });
$(document).on('change', function() {
  console.log('test');
  console.log($(document).prop('files')[0]);
       //fileの値は空ではなくなるはず
       if ($(document).val() !== '') {

           //propを使って、file[0]にアクセスする
           var image_ = $('#image').prop('files')[0];
           //添付されたのが本当に画像かどうか、ファイル名と、ファイルタイプを正規表現で検証する
           if (!/\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$/.test(image_.name) || !/(jpg|jpeg|png|gif)$/.test(image_.type)) {
               alert('JPG、GIF、PNGファイルの画像を添付してください。');
           //添付された画像ファイルが１M以下か検証する
           } else if (1048576 < image_.size) {
               alert('1MB以下の画像を添付してください。');
           } else {
               //window.FileReaderに対応しているブラウザどうか
               if (window.FileReader) {
                   //FileReaderをインスタンス化
                   var reader_ = new FileReader();
                   //添付ファイルの読み込みが成功したときに実行されるイベント（成功時のみ）
                   //一旦飛ばしてreader_ .readAsDataURLが先に動く
                   reader_.onload = function() {
                       //Data URI Schemeをimgタグのsrcにいれてリアルタイムに添付画像を描画する
                       $('#preview').attr('src', reader_.result);
                   }
                   //Data URI Schemeを取得する
                   reader_.readAsDataURL(image_);
               }
               return false;
           }
       }
       //ダメだったら値をクリアする
       $('#image').val('');
   });
