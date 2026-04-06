# Forked project - due to iOS 2FA issue
This is a fork of the original project at https://github.com/boredazfcuk/docker-icloudpd which is using [iCloud Photos Downloader (icloudpd)](https://github.com/icloud-photos-downloader/icloud_photos_downloader) to download photos from iCloud. iCloud Photos Downloader is no longer maintained/looking for a maintainer. 

I have updated the Dockerfile to use the [myMartek's](https://github.com/myMartek) [fork/PR](https://github.com/icloud-photos-downloader/icloud_photos_downloader/pull/1327) that fixes the 2FA issue (iOS 26.4+).
Once this has been merged into the main branch of icloudpd and boredazfcuk's docker-icloudpd has been updated to use version, I will archive this fork.

# docker-icloudpd
An Alpine Linux Docker container for iCloud Photos Downloader. I use it for syncing the photo streams of all the iDevices in my house back to my server because it's the only way of backing up multiple devices to a single location. It uses the system keyring to securely store credentials, has HEIC to JPG conversion capability, and can send Telegram, Prowl, Pushover, WebHook, DingTalk, Discord, openhab, IYUU, WeCom, msmtp & Signal notifications. Please note, Apple's Advanced Data Protection (ADP) is not supported. ADP must be disabled for this container to work.

# Now with remote re-authentication!
Taking advantage of the Telegram 2-way communications, it is now possible to re-authenticate your cookie by messaging the Telegram Chat Bot! Simply send a message to Telegram telling it you want to re-authenticate (see the CONFIGURATION.MD link below for details). When it's ready, it will message you back asking for the multi-factor authentication code. Send that to Telegram and it will complete the login process. No more re-initialising from the container command line!

# Now with easier local re-authentication too!
Now you can simply run reauth.sh from the Docker command line to renew you Multi-Factor Authentication cookie (again, see the CONFIGURATION.MD link below for details).

# Now with 2-way comms via Telegram!
Just send a message to the Telegram chat and the container will pick that up and sync immediately.

# Also with built-in Nextcloud upload/delete!
Just configure the Nextcloud settings and every file downloaded will be uploaded to a nextcloud server. It will also upload the JPGs it creates from HSIC file conversions. It will also sync deletes too.

## CONFIGURING ICLOUDPD

The README on Dockerhub has a hard limit of 25,000 characters, and I've hit this limit too many times now. All in all, I'm up at about 37k characters for the documentation, so this README is just a placeholder. Please see CONFIGURATION.md for info on how to configure this container. It is available here: https://github.com/boredazfcuk/docker-icloudpd/blob/master/CONFIGURATION.md

Litecoin: LfmogjcqJXHnvqGLTYri5M8BofqqXQttk4

Ethereum: 0x752F0Fc9c1D1a10Ae3ea429505a0bbe259D60C6c

Bitcoin: 1E8kUsm3qouXdVYvLMjLbw7rXNmN2jZesL or bc1q7mpp4253xeqsyafl4zkak6kpnfcsslakuscrzw