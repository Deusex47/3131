FROM quay.io/hermit/hermit-ser:latest

# Git ve Node.js'ın en son sürümlerini içeren bir imaj kullanılmalıdır.

# Eğer gerekli değilse bu satırı eklemeyebilirsiniz.
# ARG NODE_VERSION=14
# FROM node:${NODE_VERSION}-alpine

# Hata ayıklama ve ek bağımlılıklar için gerekli paketleri ekleyin
RUN apk add --no-cache \
    git \
    build-base \
    python3

# Projeyi kopyala
RUN git clone https://github.com/A-d-i-t-h-y-a-n/hermit-md /root/hermit-md

# Çalışma dizinini ayarla
WORKDIR /root/hermit-md/

# Bağımlılıkları yükle
RUN yarn install --production --ignore-engines

# Uygulamayı başlat
CMD ["node", "index.js", "--max_old_space_size=2560"]
