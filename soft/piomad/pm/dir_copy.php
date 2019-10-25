#!/usr/bin/php
<?php
//skrypt napisany dla Arka 22.05.2019 do rozdzielania plików w poszczególne katalogi
//przydaje sie gdy pliki z róznych katalogów zostana połaczone w jednym a nastepnie obrobione róznymi programami 
//program umożliwia rozpoznawanie plików na podstawie wybranych elementów ich nazw i w rezultacie może porozdzielać nie tylko oryginalne pliki ale także produkty ich analizy 
//o ile maja w nazwie te same elementy (ciągi znaków)
//program do działania potrzebuje nazw folderów docelowych (pliki list powinny sie nazywać tak jak beda sie nazywac foldery docelowe) do których ma rozdziwlać i list plików z tych folderów (czyli list oryyginalnego rozmieszczenia plików) w postaci plikó tekstowych uzyskanych poleceniem "ls -1" dla każdego z katalogów

$wmode = "copy"; //copy or move
$command = "cp";
if ($wmode == "move") {$command = "cp";} else {$commend = "mv";}

$input_files_dir = "input_files";
$input_lists_dir = "input_lists";

$output_dir = "output";
// $hgver = "hg38";


//wildards - odcinanie koncowek nazw plikow itp
$remove_x_characters_from_start = 1;
$remove_x_characters_from_end = 3;
$start_star = "";
if ($remove_x_characters_from_start  != 0) {$start_star = "*";}
$end_star = "";
if ($remove_x_characters_from_end != 0) {$end_star = "*";}

 

$main_body = "<div align=\"center\"><br> \n"
."<br> \n"
."<table bordercolordark=\"#C0C0C0\" \n"
." bordercolorlight=\"#C0C0C0\" border=\"1\" \n"
." bordercolor=\"#c0c0c0\" cellspacing=\"0\"> \n"
."  <tbody> \n"
."    <tr> \n"
."      <td> \n"
."      <table bgcolor=\"#e0e4e0\" \n"
." border=\"0\" cellpadding=\"2\" cellspacing=\"0\" \n"
." width=\"100%\"> \n"
."        <tbody> \n"
."          <tr> \n"
."            <td><font \n"
." face=\"Verdana\" size=\"1\"><strong>WARNING<br> \n"
."            </strong></font></td> \n"
."            <td align=\"right\" \n"
." valign=\"top\"> \n"
."            <div align=\"right\"> \n"
."            <table border=\"0\" \n"
." cellspacing=\"0\"> \n"
."              <tbody> \n"
."                <tr> \n"
."                  <td></td> \n"
."                  <td><a \n"
." href=\"../index.php?md=normal&sp=log\">x</a></td> \n"
."                </tr> \n"
."              </tbody> \n"
."            </table> \n"
."            </div> \n"
."            </td> \n"
."          </tr> \n"
."        </tbody> \n"
."      </table> \n"
."      </td> \n"
."    </tr> \n"
."    <tr> \n"
."      <td> \n"
."      <table align=\"center\" border=\"0\"> \n"
."        <tbody> \n"
."          <tr> \n"
."            <td width=\"500\"> \n"
."            <font color=\"#990000\"><b><font \n"
." face=\"Helvetica, Arial, sans-serif\">&nbsp;&nbsp; \n"
."&nbsp;</font></b></font><font \n"
." color=\"#990000\"><b><font \n"
." face=\"Helvetica, Arial, sans-serif\"><br> \n"
."            </font></b></font> \n"
."            <div align=\"center\"><font \n"
." color=\"#990000\"><b><font \n"
." face=\"Helvetica, Arial, sans-serif\"> \n"
."<br><br>This file may be used as CLI script only...<br><br> \n"
."<br> \n"
."            </font></b></font></div> \n"
."<form name=\"fileimportmsg_form\"><input name=\"impmes\" value=\"\" type=\"hidden\"></form>\n"
."            </td> \n"
."          </tr> \n"
."          <tr> \n"
."            <td colspan=\"3\" \n"
." rowspan=\"1\"> \n"
."            <table align=\"center\" \n"
." bgcolor=\"#c0c0c0\" border=\"1\" cellpadding=\"3\" \n"
." cellspacing=\"0\" width=\"100\"> \n"
."              <tbody> \n"
."                <tr> \n"
."                  <td nowrap=\"nowrap\" \n"
." width=\"100%\"> \n"
."                  <p align=\"center\"><a \n"
." href=\"../index.php?md=normal&sp=log\"><font \n"
." face=\"Arial\" size=\"2\"><strong>OK \n"
."                  </strong></font></a><font \n"
." face=\"Arial\" size=\"1\"><strong><br> \n"
."                  </strong></font></p> \n"
."                  </td> \n"
."                </tr> \n"
."              </tbody> \n"
."            </table> \n"
."            </td> \n"
."          </tr> \n"
."        </tbody> \n"
."      </table> \n"
."      </td> \n"
."    </tr> \n"
."  </tbody> \n"
."</table> \n"
."<br> \n"
."</div> \n";





date_default_timezone_set('Europe/Berlin');



// o ile plik nie został wykonany z wiersza polecen wszelkie dalsze dzialanie zostaje zatrzyname
$sapi_type = php_sapi_name();
if (substr($sapi_type, 0, 3) == 'cli') {
echo "CLI mode status: OK\n";
echo "Starting PHP script.....\n\n\n";

} else {
print($main_body);
exit;
}




function check_headers($naglowki ,$nazwa)
{
if (preg_match("/".$naglowki."/i",$nazwa)) {$nagl = "yes";}
else {$nagl = "no";}
return $nagl;}



  function trim_all( $str , $what = NULL , $with = ' ' )
{
    if( $what === NULL )
    {
        //  Character      Decimal      Use
        //  "\0"            0           Null Character
        //  "\t"            9           Tab
        //  "\n"           10           New line
        //  "\x0B"         11           Vertical Tab
        //  "\r"           13           New Line in Mac
        //  " "            32           Space
       
        $what   = "\\x00-\\x20";    //all white-spaces and control chars
    }
   
    return trim( preg_replace( "/[".$what."]+/" , $with , $str ) , $what );
}

function replace_newline($nazwa) {
  $nazwa = trim_all(str_replace(array("\r", "\r\n", "\n", "\n\r"), "", $nazwa));
return $nazwa;}

function replace_comma($nazwa) {
  $nazwa = str_replace(",", "", $nazwa);
return $nazwa;}

function replace_tab($nazwa) {
  $nazwa = str_replace("	", "", $nazwa);
return $nazwa;}


function replace_in_file_name($replacements, $nazwa)
{
  for ($if = 0; $if < count($replacements); $if++)
  {
  $nazwa = str_replace($replacements, "", $nazwa);
  }
return $nazwa;
}

function create_output_folder($dir_name)
{
	//jesli nie jest stworzony to tworzymy nadrzedny katalog output
	if (!file_exists($GLOBALS["output_dir"])) {
	    mkdir($GLOBALS["output_dir"]);
	    }
	//wlasciwe tworzenie podkatalogu w katalogu output
	if (!file_exists($GLOBALS["output_dir"]."/".$dir_name)) {
	    mkdir($GLOBALS["output_dir"]."/".$dir_name);
	} 
}


//tworzymy liste 
if ($handle = opendir($input_lists_dir)) {
//print("CREATING INPUT FILES ARRAY\n\n");
$i = 0;
    while (false !== ($entry = readdir($handle))) {
        if ($entry != "." && $entry != "..") 
	{
	    $input_files_array[$i] = $entry;
	    print(($i+1)." - ".$entry." [".date('Y.m.d H:i:s')."]\n");
	    $i++;
	}
    }
    closedir($handle);
}

function check_duplicates($input_files_info_array)
{
  for ($ifl = 0; $ifl < count($input_files_info_array); $ifl++)
  {
    for ($if = 0; $if < count($input_files_info_array[$ifl]["content_array"]); $if++)
    {
  for ($ifld = 0; $ifld < count($input_files_info_array); $ifld++)
  {
    for ($ifd = 0; $ifd < count($input_files_info_array[$ifld]["content_array"]); $ifd++)
    {
    if (($input_files_info_array[$ifl]["content_array"][$if]["file_name"] == $input_files_info_array[$ifld]["content_array"][$ifd]["file_name"]) && ($ifl != $ifld))
    {print("Double coping of the same file(s) to different directories were detected - please check your settings at the start of script file. Exiting...\n"); exit();}
    }
  }
    }
  }
}  
  
  //zapisanie zawartosci plikow z listami plikow w poszczegonych katalogach do tablicy
  
   $liczniks = 0; 
  
  for ($if = 0; $if < count($input_files_array); $if++)
  {

      unset($fp0);
      $fp0=fopen($input_lists_dir."/".$input_files_array[$if], "r");       
      unset($act_file_array);
      $act_file_array = [];
      
      //-----------------------------------------------------------------------------------------------------------
      //stworzenie tablicy z pierwszego pliku pary - czyli z pliku typu "mirna"
      
    rewind($fp0);
    $licznik = 0;
    $nagl = "tak";
    unset($header_array);
    
  while(!feof($fp0))
  {
  $szukana_linia = fgets($fp0);
  unset($row_array);
  unset($act_row_array_header_indexes);
  $act_row_array_header_indexes = [];
  $row_array = explode("	", $szukana_linia);
    unset($header_array);
    $header_array[0] = "file_name";
    if ($licznik == -1) 
	{$nagl = "tak";} 
    else 
	{$nagl = "nie";}
  
    if ($nagl == "tak")
    {
    $szukana_linia = replace_newline($szukana_linia);
      for ($ifn = 0; $ifn < count($row_array); $ifn ++)
      {
      $header_array[$ifn] = replace_newline($row_array[$ifn]);
      }
      //print("sdsd".count($header_array)."\n");
    }
    else if (strlen($szukana_linia) > 2) {
    $szukana_linia = replace_newline($szukana_linia);
    //indeksowanie naglowkami kolumn
	  for ($ifn = 0; $ifn < count($row_array); $ifn ++)
	      {
	      //print($row_array[$ifn]."sdsd2: \n");
	      $act_row_array_header_indexes[replace_newline($header_array[$ifn])] = substr(replace_newline($row_array[$ifn]), $remove_x_characters_from_start, (0 - $remove_x_characters_from_end));
	      }
	      //print("sdsd2: ".count($row_array)."\n");
	      	$act_file_array[$licznik] = $act_row_array_header_indexes;
	      	 //print_r($act_row_array_header_indexes); 		
	}
$licznik ++;
  }
  $input_files_info_array[$if]["file_name"] = $input_files_array[$if];
  $input_files_info_array[$if]["header_array"] = $header_array;
  $input_files_info_array[$if]["content_array"] = $act_file_array;
   
  // odblokowanie pliku
  flock($fp0, 3);

  // zamknięcie pliku
  fclose($fp0);  
 
print("STWORZONO TABLICĘ DANYCH PLIKU: ".$input_files_info_array[$if]["file_name"]."       ILOŚĆ WIERSZY/KOLUMN: ".count($input_files_info_array[$if]["content_array"])."/".count($input_files_info_array[$if]["header_array"])."\n"); 
  }
  
  
  
  
  
  
  

  
  
  
  
//tworzenie katalogow wynikowych

  for ($id = 0; $id < count($input_files_array); $id++)
  {
    create_output_folder($input_files_array[$id]);
  }  
  
  
  
//wlasciwe rozdzielanie list plikow do katalogow  wynikowych
print("Checking for copy od the same files to different directories...\n");
check_duplicates($input_files_info_array);
print("done...\n");



  
  for ($ifl = 0; $ifl < count($input_files_info_array); $ifl++)
  {
    for ($if = 0; $if < count($input_files_info_array[$ifl]["content_array"]); $if++)
    {
    
    print("-----------\n");
    print("FILE NAME: ".$start_star.$input_files_info_array[$ifl]["content_array"][$if]["file_name"].$end_star."\n");
    
    
    
    
    
    $output = shell_exec($command ." ".$input_files_dir."/".$start_star.$input_files_info_array[$ifl]["content_array"][$if]["file_name"].$end_star." ".$output_dir."/".$input_files_info_array[$ifl]["file_name"]);
    
    print("COMMAND: ".$command." ".$input_files_dir."/".$start_star.$input_files_info_array[$ifl]["content_array"][$if]["file_name"].$end_star." ".$output_dir."/".$input_files_info_array[$ifl]["file_name"]."\n");
    print("OUTPUT: ".$output."\n");
    print("-----------\n\n");
    }
  }
  
  
  
 

?>
