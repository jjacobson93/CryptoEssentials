FROM swiftdocker/swift

WORKDIR /App/

ADD ./Package.swift /App/
ADD ./Sources /App/Sources
ADD ./Tests /App/Tests

RUN swift package fetch

CMD ["swift", "test"]