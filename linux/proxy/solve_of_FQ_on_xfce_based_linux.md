1) on gnome like linux，for example ubuntu:

	1.	switch to Settings >> Network >> Network Proxy

	2.	choose Manual and input your proxy service and port
		for example:
			(vm+surge)
			HTTP Proxy 10.211.55.2 8888
			HTTPS Proxy 10.211.55.2 8888
			Socket Host 10.211.55.2 8888
			(electron-ssr):
			HTTP Proxy 127.0.0.1 12333
			HTTPS Proxy 127.0.0.1 12333
			Socket Host 127.0.0.1 12333
			(ios/mac inner-share)
			HTTP Proxy 192.168.x.x 6352
			HTTPS Proxy 192.168.x.x 6352
			Socket Host 192.168.x.x 6353

	3.	it should works simplely.

2) on xfce like linux，for example xubuntu(zoo-bun-tu):

	notice: xfce doesn't have a choise of manual proxy like gnome

	1.	install electron-ssr (or something else) first
		from https://github.com/erguotou520/electron-ssr/releases/latest
		install it use dpkg or apt,and set it up.
	2.	for chrome/firefox usage
		install SwitchyOmega from
			https://github.com/FelisCatus/SwitchyOmega/releases
		set up SwitchyOmega like
			Socks5(default) 127.0.0.1 12333
			HTTP 127.0.0.1 12333
			HTTPS 127.0.0.1 12333
	3.	for terminal use
		simplely run "export https_proxy=http://127.0.0.1:12333;export http_proxy=http://127.0.0.1:12333;#export all_proxy=socks5://127.0.0.1:12333"
		or source it to envirnmont
	4.	for certain app usage
		install proxychains use apt
			"sudo apt-get install proxychains"
		set up it in vim /etc/proxychains.conf
		run certain app under proxy using proxychains,like
			"proxychains google-chrome-stable"
		it should works

finish..


			

