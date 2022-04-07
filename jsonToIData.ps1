<###########################################################################

##################### json to IData conversion script    ###################

##################### author: Marcin Bartosiak           ###################

##################### date: 06. April 2022               ###################

##################### script published under GNU license ###################

############################################################################>

 

$path = 'jsonInput.xml'

$outputFile = 'IData.xml'

"<data>" + (Get-Content $path -Raw) | Set-Content $path

(Get-Content $path -Raw) + "</data>" | Set-Content $path

 

java -cp saxon-he-11.3.jar net.sf.saxon.Transform -t -s:input.xml -xsl:trasformata.xsl -o:$outputFile

 

(Get-Content -Path .\$outputFile) |

    ForEach-Object {$_ -Replace "<array key=", "<array  type=`"record`" depth=`"1`" name="} |

        Set-Content -Path .\$outputFile

 

(Get-Content -Path .\$outputFile) |

    ForEach-Object {$_ -Replace "<map xmlns=`"http://www.w3.org/2005/xpath-functions`">", ""} |

        Set-Content -Path .\$outputFile

 

(Get-Content -Path .\$outputFile) |

    ForEach-Object {$_ -Replace "<map xmlns=`"http://www.w3.org/2005/xpath-functions`">", ""} |

        Set-Content -Path .\$outputFile

 

(Get-Content -Path .\$outputFile) |

    ForEach-Object {$_ -Replace '</map></record>', '</record>'} |

        Set-Content -Path .\$outputFile

 

(Get-Content -Path .\$outputFile) |

    ForEach-Object {$_ -Replace "</map>","</record>"} |

        Set-Content -Path .\$outputFile

 

(Get-Content -Path .\$outputFile) |

    ForEach-Object {$_ -Replace "<map key=","<record javaclass=`"com.wm.data.ISMemDataImpl`" name="} |

        Set-Content -Path .\$outputFile

 

(Get-Content -Path .\$outputFile) |

    ForEach-Object {$_ -Replace "<string key=","<value name="} |

        Set-Content -Path .\$outputFile

 

(Get-Content -Path .\$outputFile) |

    ForEach-Object {$_ -Replace '</string>', '</value>'} |

        Set-Content -Path .\$outputFile

 

(Get-Content -Path .\$outputFile) |

    ForEach-Object {$_ -Replace '<string>', '<value>'} |

        Set-Content -Path .\$outputFile

 

(Get-Content -Path .\$outputFile) |

    ForEach-Object {$_ -Replace "<map>", "<record javaclass=`"com.wm.data.ISMemDataImpl`">"} |

        Set-Content -Path .\$outputFile

 

(Get-Content -Path .\$outputFile) |

    ForEach-Object {$_ -Replace "<number key=", "<value name="} |

        Set-Content -Path .\$outputFile

 

(Get-Content -Path .\$outputFile) |

    ForEach-Object {$_ -Replace "</number>", "</value>"} |

        Set-Content -Path .\$outputFile

 

(Get-Content -Path .\$outputFile) |

    ForEach-Object {$_ -Replace "<boolean key=", "<value name="} |

        Set-Content -Path .\$outputFile

 

(Get-Content -Path .\$outputFile) |

    ForEach-Object {$_ -Replace "</boolean>", "</value>"} |

        Set-Content -Path .\$outputFile