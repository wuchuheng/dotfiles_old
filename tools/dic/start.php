 <?php
    //header("content-type:text/html; charset=utf-8");
    //$_SERVER["argv"] //输入参数(arr)
    //$_SERVER["argc"]; //输入参数数量(int)
    if($_SERVER['argc'] <= 1) {
        exit("请输入需要翻译的参数！\n");
    }
    $appKey      =   "630a50bee42dd3f7";//应用ID
    $private     =   "BTTiLQTj4WvtvPHpm4dpdzpqldSbBY6Z";//密钥
    array_shift($_SERVER['argv']);
    $word = implode(' ',$_SERVER['argv']);
    $cacheFile = __DIR__.'/test/'.str_replace(' ','_',$word); //缓存文件名

    if(is_file($cacheFile)){ //本地缓存
        $filesize = filesize($cacheFile);
        $file = fopen($cacheFile,'r');
        $result = fread($file,$filesize);
        fclose($file);

    }else{ //远程api
        $salt = rand(1000,9999);
        $params = [
            'q'      => $word,
            'salt'   => $salt,//随机数$salt,
            'from'   => 'auto',
            'to'     => 'zh_CHS',
            'sign'   => MD5($appKey.$word.$salt.$private),
            'appKey' => $appKey
        ];
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_URL,'http://openapi.youdao.com/api');
        curl_setopt($ch,CURLOPT_HEADER,0);
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch,CURLOPT_POST,1);
        curl_setopt($ch,CURLOPT_POSTFIELDS,$params);
        $result = curl_exec($ch);
        curl_close($ch);
        /* $url         =  "http://openapi.youdao.com/api?".$world."&".$fromTo."&".$appKey."&".$salt."&".$sign; */
        /* $file_contents = file_get_contents($url); */
        saveCache($cacheFile,$result); //保存缓存
    }
    $dataArr = json_decode($result);
    $query = !empty($dataArr->query)?"源语言:".$dataArr->query."\n":"";
    echo $query;
    foreach($dataArr as $k=>$v) {
        //var_dump($dataArr);exit;
        if(function_exists($k)) {
            $k($v);
        }
    }
    //网络释义
    function web($data) {
        echo "网络释义: \n";
        $num = 1;
        foreach($data as $k=>$v) {
            $value = incodeArr($data[$k]->value);
            echo "    ".$num.":".$data[$k]->key.":".$value;
            $num++;
            echo "\n";
        }

    }
    //翻译
    function translation($data) {
        echo "翻译结果:".incodeArr($data)."\n";
    }
    //空格
    function space($num) {
        $space = "";
        for($i=1;$i<=$num;$i++) {
            $space = $space." ";
        }
        return $space;
    }
    //释义一维数组
    function incodeArr($arr) {
        if(is_array($arr)) {
            $str = "";
            $num=1;
            foreach($arr as $k=>$v) {
                $str = $str."(".$num.")".$v;
                $num++;
            }
            return $str;
        }
    }
    //基本释义
    function basic($data){
        echo "基本释义:\n";
        $arr = (array)$data;
        $usSpeech = !empty($arr["us-phonetic"])?"    美音:".$arr["us-phonetic"]."\n":'';
        $ukSpeech = !empty($arr["uk-phonetic"])?"    英音:".$arr["uk-phonetic"]."\n":'';
        echo $usSpeech.$ukSpeech;
        if(!empty($arr["explains"])) {
            echo "    词义:\n";
            $num = 1;
            foreach($arr["explains"] as $k=>$v) {
                echo "        (".$k.")".$v."\n";
                $num++;
            }
        }

    }
    //关键词处理
    function keyWork($keyWord) {
        if(is_array($keyWord)){
            array_shift($keyWord);
            $str = "";
            foreach($keyWord as $v) {
                $str = $str." ".$v;
            }
            return $str;
        }
    }

    //本地缓存
    function saveCache($cacheFile,$result)
    {
        $dir = dirname($cacheFile);
        if(!is_dir($dir)) mkdir(dirname($dir),0755,true);
        $file =  fopen($cacheFile,'w+');
        fwrite($file,$result);
        fclose($file);
    }

