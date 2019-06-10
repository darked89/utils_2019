#!/usr/bin/php
<?php
//skrypt napisany dla Arka 6.06.2019 - umozliwia wykonywanei skryptów/programow na katalogu z plikami wejsciowymi i dotyczy to takich skrytów ktore nie sa do tego przystosowane bo zawsze tworza plik wynikowy o takiej samej nazwie
//skrypt popbiera nazwy plikow w katalogu i tworzy ich liste a potem kolejno wywoluje polecenie analizujace - powstaly plik wyniokowy przenosi do katalogu output nadajac mu nazwe oryginalu rozszerzona o dodatkowa koncowke



$input_dir = "input_files";;

$temp_output_dir = "temp_output";
$final_output_dir = "final_output";


//odcinanie koncowek plikow itp
$remove_x_characters_from_start = 1;
$remove_x_characters_from_end = 4;
$add_at_start = "sss";
$add_at_end = "eee";


//gdyby byla potrzeba przekazanai paramnetrów to mozna to rozwinac
//$options = getopt("f:hp:");
//var_dump($options);
//if ($options[.....]) {???}



//---------------------------------------------------
// script name to run
//---------------------------------------------------
$command = "touch ".$temp_output_dir."/output.txt";
 

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

function create_output_folder()
{
	//jesli nie jest stworzony to tworzymy katalog temp output i final output
	if (!file_exists($GLOBALS["temp_output_dir"])) {
	    mkdir($GLOBALS["temp_output_dir"]);
	    }
	
	if (!file_exists($GLOBALS["final_output_dir"])) {
	    mkdir($GLOBALS["final_output_dir"]);
	    }
	 
}


function move_rename_output($input_file_name)
{
$remove_x_characters_from_start = $GLOBALS["remove_x_characters_from_start"];
$remove_x_characters_from_end = $GLOBALS["remove_x_characters_from_end"];


if ($handle = opendir($GLOBALS["temp_output_dir"])) {
//print("CREATING INPUT FILES ARRAY\n\n");
$i = 0;
    while (false !== ($entry = readdir($handle))) {
        if ($entry != "." && $entry != "..") 
	{
	    $ouput_files_array[$i] = $entry;
	    print(($i+1)." - ".$entry." [".date('Y.m.d H:i:s')."]\n");
	    $i++;
	}
    }
    closedir($handle);
}

for ($of = 0; $of < count($ouput_files_array); $of++)
{

$output = shell_exec("mv ".$GLOBALS["temp_output_dir"]."/".$ouput_files_array[$of]." ".$GLOBALS["final_output_dir"]."/".$GLOBALS["add_at_start"].substr(replace_newline($input_file_name), $remove_x_characters_from_start, (0 - $remove_x_characters_from_end)).$GLOBALS["add_at_end"]); 

    print("-----------\n");
    print("FILE NAME: ".$ouput_files_array[$of]."--> ".$GLOBALS["add_at_start"].substr(replace_newline($input_file_name), $remove_x_characters_from_start, (0 - $remove_x_characters_from_end)).$GLOBALS["add_at_end"]."\n");
    print("COMMAND: "."mv ".$GLOBALS["temp_output_dir"]."/".$ouput_files_array[$of]." ".$GLOBALS["final_output_dir"]."/".$GLOBALS["add_at_start"].substr(replace_newline($input_file_name), $remove_x_characters_from_start, (0 - $remove_x_characters_from_end)).$GLOBALS["add_at_end"]."\n");
    print("OUTPUT: ".$output."\n");
    print("-----------\n\n");
}


}





//tworzymy liste plikow  wkatalogu wejsciowym 
if ($handle = opendir($input_dir)) {
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
 
  
  
  //tworzymy katalogi output
create_output_folder();
  
  
  
  
  
  //wykonanie polecenia
  
   $liczniks = 0; 
  
  for ($if = 0; $if < count($input_files_array); $if++)
  {
  //wykonanie wlasciwego polecenia
  $output = shell_exec($command);
  move_rename_output($input_files_array[$if]);
  
 
  }
  
  
  
  
  
  

  
  
 

?>
