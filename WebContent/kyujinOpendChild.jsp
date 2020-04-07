<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>子ウィンドウ</title>
</head>
<body>
    <div class="container">
        <h1>子ウィンドウ</h1>

        <p>
            以下のメッセージを入力してボタンを押すと親ウィンドウに値が渡されます。<br>
            この子ウィンドウも閉じます。
        </p>

        <div class="row">
            <div class="col-md-12">
                <form name="childfrm" action="" method="post">
                    <div class="form-group">
                        <input type="text" name="sub_input" id="inputText" value="" class="form-control">
                    </div>
                    <div class="form-group">
                        <input type="button" onclick="setFormInput()" value="値を渡す" class="btn btn-success">
                    </div>
                </form>
            </div>
        </div>

    </div>

    <script type="text/javascript">
        function setFormInput() {
            // 親ウィンドウの存在チェック
            if (!window.opener || window.opener.closed)
            {
                // 親ウィンドウが存在しない場合
                window.alert('メインウィンドウが見当たりません。');
            }
            else
            {
                window.opener.document.getElementById('kaisyaName').value = document.getElementById("parent_input").value;
                window.close();
            }
        }
    </script>
</body>
</html>