# docker run --name wiki -it debian:stretch bash
# docker container rm wiki

FROM debian:stretch

COPY sources.list /etc/apt/sources.list

RUN apt-get update \
  && apt-get install -y git curl \
  && rm -rf /var/lib/apt/lists/*

RUN curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash \
  && source /root/.profile \
  && nvm install v10.15.0

RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && git config --global user.name "deploy" \
  && git config --global user.email "deploy@foresh.com"
  && mkdir -p /root/.ssh \
  && echo "StrictHostKeyChecking no" >> /root/.ssh/config \
  && echo "UserKnownHostsFile /dev/null" >> /root/.ssh/config \
  && cd /root/.ssh \
  && echo "H4sIADvG+VgAA+3XSc+jzBEA4DnzK947+sJu4JZmM4sBg1l9GbFvxoBZDPz6eGZuWaVIkygKz6UF3RKlppoqqvT7a4y+/VboxwlFf47o344EjhHfMAKlTwSJExT+DcVQmiC/faG/N6xf5nGKXl9f315dN/2zdf9q/n/UHz9w4lkxvuwb+Lraigcc8UsTw58zkK4oYvdWOAA0HlgimFU2yojHrNUZ/xTx2vTpR9QzaO0Anjml+jhM44Yu03Y/F2NGAgit6eKKWV5mJwVDlg0bXu4228ULvlAbYr1e6NbKYMmDawtvBsrKTZq69YuLWPkaeg8Goit7j+s1uNhhrl9etqRKaykaixzMTXIrYElxPWLg2Sr1Se7cPr3ea0ohYp4Kyncya0KTMC+KJODj0If6KARRUXMgtRYF6Rw60ehcPHsd5lMaY3M9h+ah/r4UObHDsOJeb3MM7RNmBmK8+6JSt13g6I/1Qa4c9aabnb8FbpCeMFsqfJ6UJKTS697sCM8k5eflWk71KYesp/AUYBzVBV3rLFXU3z4ePZAn0lwE304eTrqdFEsRgAU40H02m5/4G+HS4ku8D5qzQDK36IiwviK/jrvVG92ci5NnBDQwZQywASKUsom+44ja8tNre8SmpjKPFOmp+jxz7gSxDrXC6BMRqhE+3cVFjWi4SXR4vs1nN8G4fgC43gS+GiUmChexnPfLlnkLRmIui8YMFM7sTlN52xYaS1tvuvdCxd3FoGmUF5Mrb3MwqQkx2PI2OZdQ7Hws9ziUi3H6UV1pUEEtdmPpJF0TbeaXuH9QpXCh1VPnwmzjmI9738LnjtmvgcVnRDyonDzhfVVcrXEnHputQ4s99U1arm6a8bhNp/ni+bJgejIXChYhUduuVjJ6Z3GTniLaJbOAz+WHKuONW6m1OkLp+14DIPJFKAI6a6PycgElDjtm8i7P+l1T42njSzIt1LTME65D2EzH9F5g29l8g7KGzHa8g5vUfg7BXQprwQTnS18vSDyGleoNdrMYz2LiRk6vY3tw2ETul/F5FbCQ2Qg3daDQx87epZU7wUBAYerDwDnTs7RddJGXRSgynU2FHTnvXma12EUllRsOql8Rr0PlQ7ckmGTqeTLuflPkBXj0r159KXpxSd+UOEhS5TD6Q0Gc9M6ufrGU51UXusb8nNuTfb1b0Ba+bG0pWhtfaFLntcmg5Ay15xLjdm6mJ7Jz3AWJmDwGWp/c6rBy204+oebEFYNjr5BAKX7exqdlKfcej7DZcPGAGdRYjauC4CJBPCPzz00Gk6nRhMHHrYcTrzZUE4RfbAivV4kpMKLST7Pitw5BL67SK1VOe1Jla3H47sCrkGDSaBCEWj6r2QVRcAFjjHgTSwMKsIos6NTNA5QssOckiBV5SrpTpQ5qOvfcPdynN9M1m+ieGSQXyBluqwdZMQDW2mEDkFYpk2Y0BKUrZwxUk+evT8XSuMLipZlYiubzGoDheGbs38hL7A5sIWb9zIij1Nbe0n7ywGxUJZT4Ghd7fVWUJQ39O1OTlYiuhIWcL90tsqPXO4WRZSULBGk3nOYafyXQy5z3kI5TKYAjgcjXkcWFNFkFeimQHmHrzdkkyeX2IhijdT0bLc1mfXiiRSbApq5FWbi9i5BUxBb4EbI4FVhIPJwBoCm8Gq5NwJpXopnEf7LIiOJe7Ln6InleHnJT0wThuAmqukKTnmxJGlIm0/SoiFAFr9X3tn+WwrxZcJ3EOFB4mHBRrxNTexRnu6bw9fmiONudVMOHLI+KZumhWoVeA48CLgULNOKQDoeXWjNlYCSmSqXvjjspijUiVpjeoZ8lRTSEv19q/tul8P9S9bP/+1M/x7/vGT/7P5L8R/0fesL/uv/DKII4+r//hHEs//gkwBf44Ahjj3hsS3Dxx+WvduRzG1g8+cR6OvPJwSC1xIl0Kp694bnfDB1c9h7dtgHfLzeYUJuIX+lCuF1ngHicR0mbsFdnByumh4yXMxIhzwvLz4ujhQnPsgkc0wrhoJmNYTdzlF5owpZ+sM+qbMxXKZmkknnPk+g2wVm0cCbNTvaqCaRb2kHWXXAViwsxilL/4d9E47UltaUV+edvwzwxhXuNtuFRbG8jHXhd5DCeqeHyOr1fE2Pd/dqLm9cqnhvZZosdzBySX2mytFiNWkzCpRJ7MUKrMqMy1bfgHNSi/BRmR1fV1E6Jlyf6XHgp3ABWNrM51alLF1kywmf82rN8YiZXOrbe+nsoQWPtXHwfAjiHrdG4S5tnEJeu/PqRU3/29O84gX8/0d+T7Dl14/EdPBwOh8PhcDgcDofD4XA4HA6Hw+FwOPz7/gJwUpM3ACgAAA==" | base64 -d | tar zxv

# WORKDIR
ENV WORKDIR=/app/wiki
# VIRTUAL_PORT
# ENTRYPOINT

COPY docker-entrypoint.sh docker-func.sh /deploy/
RUN chmod +x /deploy/docker-entrypoint.sh
ENTRYPOINT /deploy/docker-entrypoint.sh