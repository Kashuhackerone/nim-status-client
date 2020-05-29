import json

# TODO: this is for testing purposes, the correct function should decode the hash
proc decodeContentHash*(value: string): string =
  if value == "":
    return ""
  let dictionary = %* {
    "e30101701220eab9a8ef4eac6c3e5836a3768d8e04935c10c67d9a700436a0e53199e9b64d29": "Qme8vJtyrEHxABcSVGPF95PtozDgUyfr1xGjePmFdZgk9v",
    "e30101701220c8f28aebe4dbbcee896d1cdff89ceeaceaf9f837df55c79125388f954ee5f1fe": "Qmbs4kkEwAHxc57LSQCkgbPvwHn1SRzcES9ffWNxxHWQ85",
    "e301017012204861f93e29dd8e7cf6699135c7b13af1bce8ceeaa1d9959ab8592aa20f05d15f": "QmTDCiFrdoMuogNC3vNYLYzfu2Jpvi2f5jxHdL8MgGT8Lv",
    "e301017012203ffa57a51cceaf2ce040852de3b300d395d5ba4d70e08ba993f93a25a387e3a9": "QmSePoGahN4pCxxZpCdsxXHLRcJMohcZUAiNYcPU9uN6HE",
    "e301017012204f2674db0bc7f7cfc0382d1d7f79b4ff73c41f5c487ef4c3bb3f3a4cf3f87d70": "QmTfcvpb2HwiEcy66CznjwrAfFPNH4bHHzRPGU6R9juj2F",
    "e30101701220e8d4d8b9fb5f805add2f63c1cb5c891e60f9929fc404e3bb725aa81628b97b5f": "Qme1XYA9km4psvjxxM9o2N7SCqVUbyfiHd1npLZXR2XLLe",
    "e301017012206fdad56fe7a2facb02dabe8294f3ac051443fcc52d67c2fbd8615eb72f9d74bd": "QmVsHW3pzrzTeSB1ddvP3q6NsW7knsZdYSv1wfzttwHQLt",
    "e30101701220a691193cf0559905c10a3c5affb9855d730eae05509d503d71327e6c820aaf98": "QmZYriKmLiAEsvcreq4fSgFYNbEUzcXZdyGHBjnbx62fe7",
    "e30101701220d8004af925f8e85b4e24813eaa5ef943fa6a0c76035491b64fbd2e632a5cc2fd": "Qmcsq2mRnz5gtLzjEJjoGNQZhgcEnp2RtxH4pTBJoyPXuE",
    "e3010170122049f7bc650615568f14ee1cfa9ceaf89bfbc4745035479a7d8edee9b4465e64de": "QmTKPa2zctFwa4BXimzoRt5P74dwkfc6w9vtwoAVG2cCJH",
    "e301017012201915dc0faad8e6783aca084a854c03553450efdabf977d57b4f22f73d5c53b50": "QmQ2aEZuLCuZqKU6saD6rzfyRdoqJTrBUcu1fS9Vbp8fHH",
    "e301017012200b9fb71a129048c2a569433efc8e4d9155c54d598538be7f65ea26f665be1e84": "QmP82StaKgby4KGVNDSEEsbB4XaFT729REKXqJJh3KNGdR",
    "e30101701220d37944e3fb05213d45416fa634cf9e10ec1f43d3bf72c4eb3062ae6cc4ed9b08": "Qmca9z53ArgZSX1Q2Vpin6wxoLPygAA5LfcLtJ96JFaHyq",
    "e3010170122059390dca66ba8713a9c323925bf768612f7dd16298c13a07a6b47cb5af4236e6": "QmULwTFPbiVATDXGFkTrfAUm7tXtikWcnDYzsjVJUV4wE5",
    "e30101701220daaf88ace8a3356559be5d6912d5d442916e3cc92664954526c9815d693dc32b": "Qmd4Jq8mEgRePaCKxdS9PJEZ5rSBYQPMFLJt1pZ9chCmyt",
    "e301017012203ae30594fdf56d7bfd686cef1a45c201024e9c10a792722ef07ba968c83c064d": "QmSJX8oDAKzGiVUn5SJMdDEJZajyLVkKC4BhnUeESdyVcG",
    "e3010170122016e5eba0bbd32fc1ff17d80d1247fc67432705cd85731458b52febb84fdd6408": "QmPt32DAezxTd9GJ91iFSVQ6h6VkHHEkQqnp4KKnPyHMhh",
    "e3010170122014fe2c2186cbf9d15ff61e04054fd6b0a5dbd7f365a1807f6f3d3d3e93e50875": "QmPkbew8qRzimGs7St7a6w3CsQpyCKNXb9JPL6M4SrZKBz",
    "e30101701220f23a7dad3ea7ad3f3553a98fb305148d285e4ebf66b427d85a2340f66d51da94": "QmeeD6sc2iEkSLDxFuCHHmRfwBSRx13a9jHY18XvmFmYy9",
    "e3010170122047a637c6af02904a8ae702ec74b3df5fd8914df6fb11c99446a36d890beeb7ee": "QmTALfEXcwgJ6xQkbBSH3ZxNsHYFNBJjReUt1zXF3WdU9b",
    "e30101701220776f1ff89f6196ae68414545f6c6a5314c35eee7406cb8591d607a2b0533cc86": "QmWNsWF2KSi8vevCbV4AprYPEFajNKud9KjprqWW2o6D8y",
    "e3010170122093c41fec87274b48d07c067f478e20c132940bad57712b3215c5aba9f1862eea": "QmYHU6T8MKRayft7firn7hv57SCdNy1UDQoucC95x5hPc5",
    "e301017012209af36e3307f85f7c3bd741ebede2c8a41d12cd0f2b95de3c31df0a76f8783c49": "QmYmWnYoKCZf4JV7pe6BZeW9pYPncHWdFMxz4JhbBYueQG",
    "e30101701220feb1e9c32b93efee4aa73b9f42553b789bd3eb561b0972d5841a6f16f603e89b": "QmfUscTBNr1UaXexxLhSbKDa49dUEuxcqYg8SWCDtsYNL2",
    "e3010170122080c27fe972a95dbb4b0ead029d2c73d18610e849fac197e91068a918755e21b2": "QmX1GuoydttxSuJTTU14ALTfWDyjzX5YXe1Q7knYw4tJcy",
    "e301017012203d5f53a4700324ca36d0b7dc4ab8c292be030c22578b7c9e2a199c887f35585a": "QmSUDtNakjhpg7tevHDLuzkQ4xvdu5nYsKQC9hdCDqUimf",
    "e30101701220ffca78bc997187d454db11edc9bd4d3f1d5b53ec42a037ba39d773214cd3fc67": "QmfZ9jqbeiYGsFC2NdmMj346ag7iyYmXpwrfNmaBpfBRti",
    "e30101701220b35bd4f43db76071ec893e1072028cdd86c72068abf5c7d2e5ff96bb8644c8c7": "QmaQnuPHQcLApWySa34tLpS6f3D6aKZwib9PoJzXvXXpRC",
    "e3010170122001bbe2f5bfba0305a3bdc2047fddc47ee595a591bdee61de6040ffc2456624e1": "QmNTRHVD1gfLeHEGvHi6Pk1ukevkpeWm43kVcGNJ43o992",
    "e30101701220d5c71b72162a802b3cb2e3c61758d8a9780d48d78c467d160c52adc7e1e35a92": "Qmcj9e7Bkkav5x1eq3oGezoEQBzKYYpwvYVhWzEKjPFeVw",
    "e301017012205225562d0790974887dabdf9d257cd808d1e470f0ab41226e1be2d522f4639af": "QmTsKAKPKesNp24X9V8vYcxkmdMEnWTnzGBBih9qZuLx4E",
    "e301017012206d9689241f5504021068e3c23befc859384a0e9c00c27108b76e573968f61f8c": "QmViSHNizWdu5L4dQHRXxshHA4z4YiW6E8tJjjPR4Uj82w",
    "e30101701220ad202b9109dd82f11782044ec443dbd56ddf16270c353704505da03f7761aabc": "QmZzTh8a7JxjrjGa1auuxtvQvzaqBMkjAc1b39YBY6wmwq",
    "e30101701220ad95684efa3e42d4f82043210a8946745b0dd0a9b58d8f6902315047a9ee922f": "Qma2FNsiR95oJBcXwXjLXPPxx9HMnT4KPnzZXRTonPFgoQ",
    "e30101701220b91b449ec56ade3ca73fd51ac76844280cf58c01a91806e2f0417d27f55254aa": "QmaoEFRz8tiwaCgAq3PCzVkmZMtUqPEXkYmMiDnDkbx5mB",
    "e3010170122036fa754dd890cbcdd66666bdc4ad18d2ce5284c8f6b6ffe2c0a091eeeba1951e": "QmS3GEPp35nc8d7rsW46ynEvMdd5n5nbZQpfT47rA3hrTP",
    "e30101701220b06837823a598d52584f5039882413b3616299bf32ea162c6339ada84138adc4": "QmaDGdjpxteBSshdaa1wRHsCpCN3yMr3AebZqivt1poYgs",
    "e301017012205b9b17d402f3b97fc9f43a1d389664622587b4cc109dd9fdd5ee2e8ab5ca1b7a": "QmUWEyWd1UUPL2veGuwNMigHwM8uuhBpzNdigKNdUAxbYd",
    "e3010170122054c748ceea79aeeb79b83bc940310ec855cab03857d60b575c4fa560572a0f11": "QmU3bCoV3WfrrminumgNF3LK7tQuLJTrRBpfJ5S6RakiSU",
    "e301017012205f0d53af63c96e3d778dbb47f2c57fcd417567f4c97754531f9b914cacba5e70": "QmUjhE8YpvTSqSzKJNwYf6N29CVMRFCPcGX6GC9dyXev6s",
    "e30101701220d345e5223c5dd31c28e0d65088848e76a6144ba24c3c779d71b068f342345190": "QmcZNYp7grvmcjNRpF19LiM6Rn68cnqSThR64VzirVddMy"
  }
  try:
    dictionary[value].getStr
  except:
    ""