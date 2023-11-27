
FROM quay.io/hermit/hermit-ser:latest

# Projeyi kopyala
RUN git clone https://github.com/A-d-i-t-h-y-a-n/hermit-md /root/hermit-md

# Çalışma dizinini ayarla
WORKDIR /root/hermit-md/

# Bağımlılıkları yükle
RUN yarn install --production --ignore-engines

# Uygulamayı başlat
CMD ["node", "index.js", "--max_old_space_size=2560"]
