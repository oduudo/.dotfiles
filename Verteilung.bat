
:: ### .dircolors
::copy .dircolors c:\users\udojanzen\.dircolors
::copy .dircolors \\UDOSDS413\home\.dircolors
::copy .dircolors \\UDOSDS916\home\.dircolors
::copy .dircolors \\UDOSPI2\udo\.dircolors


:: ### .bash_profile

:: ### .inputrc

:: ### .bashrc
::copy .bashrc c:\users\udojanzen\.bashrc
::copy .bashrc \\UDOSDS413\home\.bashrc
::copy .bashrc \\UDOSDS916\home\.bashrc
::copy .bashrc \\UDOSPI2\udo\.bashrc

::### .profile
::copy .profile c:\users\udojanzen\.profile
::copy .profile \\UDOSDS413\home\.profile
::copy .profile \\UDOSDS916\home\.profile
::copy .profile \\UDOSPI2\udo\.profile

::### .dotfiles
::del c:\users\udojanzen\.dotfiles
::del \\UDOSDS413\home\.dotfiles
::del \\UDOSDS916\home\.dotfiles
::del \\UDOSPI2\udo\.dotfiles

::xcopy /E .dotfiles c:\users\udojanzen\.dotfiles
::xcopy /E .dotfiles \\UDOSDS413\home\.dotfiles
::xcopy /E .dotfiles \\UDOSDS916\home\.dotfiles
::xcopy /E .dotfiles \\UDOSPI2\udo\.dotfiles

:: PC
xcopy /E /Y .* c:\users\udojanzen
xcopy /E /Y .dotfiles c:\users\udojanzen\.dotfiles
::xcopy /E /Y .nano c:\users\udojanzen\.nano
:: PI FHEM
xcopy /E /Y .* \\UDOSPI2\udo
xcopy /E /Y .dotfiles \\UDOSPI2\udo\.dotfiles
::xcopy /E /Y .nano \\UDOSPI2\udo\.nano
:: UdosPi3bp01
xcopy /E /Y .* \\UdosPi3bp01\udo
xcopy /E /Y .dotfiles \\UdosPi3bp01\udo\.dotfiles
::xcopy /E /Y .nano \\UdosPi3bp01\udo\.nano
:: UdosPi3bp02
xcopy /E /Y .* \\UdosPi3bp02\udo
xcopy /E /Y .dotfiles \\UdosPi3bp02\udo\.dotfiles
::xcopy /E /Y .nano \\UdosPi3bp02\udo\.nano
:: DS916
xcopy /E /Y .* \\UDOSDS916\home
xcopy /E /Y .dotfiles \\UDOSDS916\home\.dotfiles
::xcopy /E /Y .nano \\UDOSDS916\home\.nano
:: DS413
xcopy /E /Y .* \\UDOSDS413\home
xcopy /E /Y .dotfiles \\UDOSDS413\home\.dotfiles
::xcopy /E /Y .nano \\UDOSDS413\home\.nano
