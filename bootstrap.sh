#!/bin/bash
TMP_DIR=$(mktemp -d)
echo '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YW4gLVN5IC0tbmVlZGVkIC0tbm9jb25maXJtIGRpYWxvZwogICAgCiAgICB0aW1lZGF0ZWN0bCBzZXQtbnRwIHRydWUKICAgIAogICAgRFJJVkVfTElTVD0kKCBcCiAgICAgICAgICAgIGxzYmxrIC1kcGxueCBzaXplIC1vIG5hbWUsc2l6ZSB8IGdyZXAgLUV2ICJib290fHJwbWJ8bG9vcCIgfCB0YWMpCiAgICBEUklWRT0kKCBcCiAgICAgICAgICAgIGRpYWxvZyAtLXN0ZG91dCAtLW1lbnUgIlNlbGVjdCBpbnN0YWxsYXRpb24gZGlzayIgMCAwIDAgXAogICAgICAgICAgICAgICAgICAgICR7RFJJVkVfTElTVH0pIHx8IFwKICAgICAgICAgICAgZXhpdCAxCiAgICAKICAgIEhPU1ROQU1FPSQoZGlhbG9nIC0tc3Rkb3V0IC0taW5wdXRib3ggIkVudGVyIGhvc3RuYW1lIiAwIDApIHx8IGV4aXQgMQogICAgUk9PVF9QQVNTV09SRD0kKCBcCiAgICAgICAgICAgICAgICBkaWFsb2cgLS1zdGRvdXQgLS1pbnB1dGJveCAiRW50ZXIgcm9vdCBwYXNzd29yZCIgMCAwKSBcCiAgICAgICAgICAgICAgICB8fCBleGl0IDEKICAgIE1FRElBX0JPWF9VU0VSPSQoCiAgICAgICAgICAgIGRpYWxvZyAtLXN0ZG91dCAtLWlucHV0Ym94ICJFbnRlciBtZWRpYSBib3ggdXNlciBuYW1lIiAwIDApIFwKICAgICAgICAgICAgfHwgZXhpdCAxCiAgICBNRURJQV9CT1hfUEFTU1dPUkQ9JChkaWFsb2cgLS1zdGRvdXQgLS1pbnB1dGJveCBcCiAgICAgICAgICAgICJFbnRlciBtZWRpYSBib3ggdXNlciBwYXNzd29yZCIgMCAwKSBcCiAgICAgICAgICAgIHx8IGV4aXQgMSAgICAKICAgIAogICAgIyBzd2FwOiAzODE0IE1pQgogICAgIyBmb3NzaWw6IDM4MTUgTWlCCiAgICAjIHVwZGF0ZTogNTcyMiBNaUIKICAgICMgbWFpbjogcmVtYWluZGVyCiAgICAKICAgIGlmIGxzIC9zeXMvZmlybXdhcmUvZWZpL2VmaXZhcnMgJj4gL2Rldi9udWxsOyB0aGVuCiAgICAgICAgQk9PVF9NT0RFPSJ1ZWZpIgogICAgICAgIAogICAgICAgIHBhcnRlZCAtLXNjcmlwdCAiJHtEUklWRX0iIC0tIG1rbGFiZWwgZ3B0IFwKICAgICAgICAgICAgICAgIG1rcGFydCAiXCJFRkkgc3lzdGVtIHBhcnRpdGlvblwiIiBmYXQzMiAxTWlCIDUxM01pQiBcCiAgICAgICAgICAgICAgICBzZXQgMSBlc3Agb24gXAogICAgICAgICAgICAgICAgbWtwYXJ0ICJcInN3YXAgcGFydGl0aW9uXCIiIGxpbnV4LXN3YXAgNTEzTWlCIDQzMjdNaUIgXAogICAgICAgICAgICAgICAgbWtwYXJ0ICJcImZvc3NpbCBwYXJ0aXRpb25cIiIgZXh0NCA0MzI3TWlCIDgxNDJNaUIgXAogICAgICAgICAgICAgICAgbWtwYXJ0ICJcInVwZGF0ZSBwYXJ0aXRpb25cIiIgZXh0NCA4MTQyTWlCIDEzODY0TWlCIFwKICAgICAgICAgICAgICAgIG1rcGFydCAiXCJtYWluIHBhcnRpdGlvblwiIiBleHQ0IDEzODY0TWlCIDEwMCUKICAgICAgICAKICAgICAgICBta2ZzLmZhdCAtRjMyICIke0RSSVZFfTEiCiAgICAgICAgCiAgICAgICAgQURESVRJT05BTF9QS0dTPSJlZmlib290bWdyIgogICAgZWxzZQogICAgICAgIEJPT1RfTU9ERT0iYmlvcyIKICAgICAgICAKICAgICAgICBwYXJ0ZWQgLS1zY3JpcHQgIiR7RFJJVkV9IiAtLSBta2xhYmVsIGdwdCBcCiAgICAgICAgICAgICAgICBta3BhcnQgIlwiR1JVQiBib290IHBhcnRpdGlvblwiIiBmYXQzMiAxTWlCIDJNaUIgXAogICAgICAgICAgICAgICAgc2V0IDEgYmlvc19ncnViIG9uIFwKICAgICAgICAgICAgICAgIG1rcGFydCAiXCJzd2FwIHBhcnRpdGlvblwiIiBsaW51eC1zd2FwIDJNaUIgMzgxNk1pQiBcCiAgICAgICAgICAgICAgICBta3BhcnQgIlwiZm9zc2lsIHBhcnRpdGlvblwiIiBleHQ0IDM4MTZNaUIgNzYzMU1pQiBcCiAgICAgICAgICAgICAgICBta3BhcnQgIlwidXBkYXRlIHBhcnRpdGlvblwiIiBleHQ0IDc2MzFNaUIgMTMzNTNNaUIgXAogICAgICAgICAgICAgICAgbWtwYXJ0ICJcIm1haW4gcGFydGl0aW9uXCIiIGV4dDQgMTMzNTNNaUIgMTAwJQogICAgZmkKICAgIAogICAgbWtzd2FwICIke0RSSVZFfTIiCiAgICAKICAgIEZPU1NJTF9QQVJUSVRJT049IiR7RFJJVkV9MyIKICAgIFVQREFURV9QQVJUSVRJT049IiR7RFJJVkV9NCIKICAgIE1BSU5fUEFSVElUSU9OPSIke0RSSVZFfTUiCiAgICAKICAgIGlmIFtbICIkKGJsa2lkIC1zIFRZUEUgLW8gdmFsdWUgJEZPU1NJTF9QQVJUSVRJT04pIiAhPSAiZXh0NCIgXV07IHRoZW4KICAgICAgICBta2ZzLmV4dDQgLUYgIiRGT1NTSUxfUEFSVElUSU9OIgogICAgZWxzZQogICAgICAgICMgSWYgd2UgaGFwcGVuIHRvIGhhdmUgYSBwYWNtYW4tY2FjaGUsIGxldCdzIGtlZXAgaXQgdG8gc2F2ZSBzb21lIHRpbWUsCiAgICAgICAgIyBidXQgZGVsZXRlIGV2ZXJ5dGhpbmcgZWxzZS4KICAgICAgICAKICAgICAgICBta2RpciAtcCAvbW50L2Zvc3NpbAogICAgICAgIG1vdW50ICIkRk9TU0lMX1BBUlRJVElPTiIgL21udC9mb3NzaWwKICAgICAgICAKICAgICAgICBmb3IgTk9ERSBpbiAvbW50L2Zvc3NpbC8qOyBkbwogICAgICAgICAgICBpZiBbWyAiJE5PREUiICE9ICIvbW50L2Zvc3NpbC9wYWNtYW4tY2FjaGUiIF1dOyB0aGVuCiAgICAgICAgICAgICAgICBybSAtcmYgIiROT0RFIgogICAgICAgICAgICBmaQogICAgICAgIGRvbmUKICAgICAgICAKICAgICAgICB1bW91bnQgL21udC9mb3NzaWwKICAgIGZpCiAgICAKICAgIG1rZnMuZXh0NCAtRiAiJFVQREFURV9QQVJUSVRJT04iCgogICAgbWtkaXIgLXAgL21udC9mb3NzaWwKICAgIG1vdW50ICIkRk9TU0lMX1BBUlRJVElPTiIgL21udC9mb3NzaWwKICAgIG1rZGlyIC1wIC9tbnQvZm9zc2lsL3BhY21hbi1jYWNoZQogICAgCiAgICBjcCBkZWZhdWx0LWRhbmRsZXNzeS1jb25maWcgL21udC9mb3NzaWwvZGFuZGxlc3N5LWNvbmZpZwogICAgY3Aga25vd25faG9zdHMgL21udC9mb3NzaWwva25vd25faG9zdHMKICAgIAogICAgc2VkIC1pICJzL3t7aG9zdG5hbWV9fS8kSE9TVE5BTUUvZyIgL21udC9mb3NzaWwvZGFuZGxlc3N5LWNvbmZpZwogICAgICAgIAogICAgc2VkIC1pICJzfHt7bWFpbi1wYXJ0aXRpb259fXwkTUFJTl9QQVJUSVRJT058ZyIgXAogICAgICAgICAgICAvbW50L2Zvc3NpbC9kYW5kbGVzc3ktY29uZmlnCgogICAgc2VkIC1pICJzL3t7bWVkaWEtYm94LXVzZXJ9fS8kTUVESUFfQk9YX1VTRVIvZyIgXAogICAgICAgICAgICAvbW50L2Zvc3NpbC9kYW5kbGVzc3ktY29uZmlnCiAgICAKICAgIG1rZGlyIC1wIC9tbnQvZ3Vlc3QKICAgIG1vdW50ICIkVVBEQVRFX1BBUlRJVElPTiIgL21udC9ndWVzdAogICAgCiAgICBpZiBbWyAiJEJPT1RfTU9ERSIgPT0gInVlZmkiIF1dOyB0aGVuCiAgICAgICAgbWtkaXIgLXAgL21udC9ndWVzdC9ib290L2VmaQogICAgICAgIG1vdW50ICIke0RSSVZFfTEiIC9tbnQvZ3Vlc3QvYm9vdC9lZmkKICAgIGZpCiAgICAKICAgIHBhY3N0cmFwIC1jIC9tbnQvZ3Vlc3QgLS1jYWNoZWRpciAiL21udC9mb3NzaWwvcGFjbWFuLWNhY2hlIiBcCiAgICAgICAgICAgIGFyY2gtaW5zdGFsbC1zY3JpcHRzIGJhc2UgZ2l0IGdydWIgaW50ZWwtdWNvZGUgbGludXggXAogICAgICAgICAgICBsaW51eC1maXJtd2FyZSBuZXR3b3JrbWFuYWdlciBvcGVuc3NoIG9zLXByb2JlciB3Z2V0IFwKICAgICAgICAgICAgJEFERElUSU9OQUxfUEtHUwogICAgCiAgICBVUERfSE9TVE5BTUU9JChyYW5kb21TbHVnIDEwKQogICAgZWNobyAiJFVQRF9IT1NUTkFNRSIgPiAvbW50L2d1ZXN0L2V0Yy9ob3N0bmFtZQogICAgCiAgICBta2RpciAtcCAvbW50L2d1ZXN0L21udC9mb3NzaWwKICAgIG1vdW50ICIkRk9TU0lMX1BBUlRJVElPTiIgL21udC9ndWVzdC9tbnQvZm9zc2lsCiAgICAKICAgIGdlbmZzdGFiIC1VIC9tbnQvZ3Vlc3QgPj4gL21udC9ndWVzdC9ldGMvZnN0YWIKICAgIAogICAgVVBEX0hPU1RTPScvbW50L2d1ZXN0L2V0Yy9ob3N0cycKICAgIGVjaG8gJzEyNy4wLjAuMSBsb2NhbGhvc3QnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+ICIkVVBEX0hPU1RTIgogICAgZWNobyAnOjoxJyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPj4gIiRVUERfSE9TVFMiCiAgICBlY2hvICIxMjcuMC4xLjEgJFVQRF9IT1NUTkFNRS5sb2NhbGRvbWFpbiAkVVBEX0hPU1ROQU1FIiA+PiAiJFVQRF9IT1NUUyIKICAgIAogICAgR0VUVFlfUEFUSD0nL21udC9ndWVzdC9ldGMvc3lzdGVtZC9zeXN0ZW0vZ2V0dHlAdHR5MS5zZXJ2aWNlLmQnCiAgICBta2RpciAtcCAiJEdFVFRZX1BBVEgiCiAgICAKICAgIEdFVFRZX0NPTkY9IiRHRVRUWV9QQVRIL2F1dG9sb2dpbi5jb25mIgogICAgZWNobyAnW1NlcnZpY2VdJyA+ICIkR0VUVFlfQ09ORiIKICAgIGVjaG8gJ0V4ZWNTdGFydD0nID4+ICIkR0VUVFlfQ09ORiIKICAgIGVjaG8gJ0V4ZWNTdGFydD0tL3Vzci9iaW4vYWdldHR5JyBcCiAgICAgICAgICAgICctLWF1dG9sb2dpbiByb290IC0tbm9jbGVhciAlSSAzODQwMCBsaW51eCcgPj4gIiRHRVRUWV9DT05GIgogICAgCiAgICBjcCBkYW5kbGVzc3ktdXBkYXRlIC9tbnQvZ3Vlc3QvdXNyL2Jpbi9kYW5kbGVzc3ktdXBkYXRlCiAgICBjaG1vZCBhK3ggL21udC9ndWVzdC91c3IvYmluL2RhbmRsZXNzeS11cGRhdGUKICAgIAogICAgZWNobyAnZGFuZGxlc3N5LXVwZGF0ZScgPj4gL21udC9ndWVzdC9yb290Ly5wcm9maWxlCiAgICAKICAgIGxuIC1zZiAvbW50L2d1ZXN0L3Vzci9zaGFyZS96b25laW5mby9VUy9FYXN0ZXJuIC9tbnQvZ3Vlc3QvZXRjL2xvY2FsdGltZQogICAgc2VkIC1pICJzLyNlbl9VUy5VVEYtOCBVVEYtOC9lbl9VUy5VVEYtOCBVVEYtOC9nIiAvbW50L2d1ZXN0L2V0Yy9sb2NhbGUuZ2VuCiAgICAKICAgIGVjaG8gJ0xBTkc9ZW5fVVMuVVRGLTgnID4gL21udC9ndWVzdC9ldGMvbG9jYWxlLmNvbmYKICAgIAogICAgc2VkIC1pICdzfCNDYWNoZURpciAqPS4qfENhY2hlRGlyPS9tbnQvZm9zc2lsL3BhY21hbi1jYWNoZS98ZycgXAogICAgICAgICAgICAvbW50L2d1ZXN0L2V0Yy9wYWNtYW4uY29uZgogICAgCiAgICAjIFdlIG5lZWQgYSBzbGlnaHRseSBkaWZmZXJlbnQgR1JVQiBpbnN0YWxsIGJhc2VkIG9uIEJJT1MgdnMuIFVFRkkuCiAgICBpZiBbWyAiJEJPT1RfTU9ERSIgPT0gInVlZmkiIF1dOyB0aGVuCiAgICAgICAgIyBVRUZJCiAgICAgICAgCiAgICAgICAgIyBNdXN0IGJlIC0tcmVtb3ZhYmxlIHRvIGFjY29tb2RhdGUgVmlydHVhbEJveCBpbnN0YWxscy4KICAgICAgICAjIGh0dHBzOi8vc3VwZXJ1c2VyLmNvbS9hLzEyNjM4MzkKICAgICAgICAKICAgICAgICBHUlVCX0lOU1RBTEw9JChlY2hvIFwKICAgICAgICAgICAgICAgICdncnViLWluc3RhbGwgLS10YXJnZXQ9eDg2XzY0LWVmaSAtLWVmaS1kaXJlY3Rvcnk9L2Jvb3QvZWZpJyBcCiAgICAgICAgICAgICAgICAnLS1ib290bG9hZGVyLWlkPUdSVUIgLS1yZW1vdmFibGUnKQogICAgZWxzZQogICAgICAgICMgQklPUwogICAgICAgIEdSVUJfSU5TVEFMTD0iZ3J1Yi1pbnN0YWxsIC0tdGFyZ2V0PWkzODYtcGMgJERSSVZFIgogICAgZmkKICAgIAogICAgIyBXZSBjcmVhdGUgdXNlcnMgYW5kIHNldCBwYXNzd29yZHMgc3BlY2lmaWNhbGx5IHRvIGdlbmVyYXRlIGEgc2Vuc2libGUKICAgICMgL2V0Yy9zaGFkb3cgZmlsZSB3aXRoIHdoaWNoIHRvIHNlZWQgdGhlIGxpdmUgc3lzdGVtIHNvIHdlIGRvbid0IGhhdmUgdG8KICAgICMgc3RvcmUgcGxhaW50ZXh0IHBhc3N3b3JkcyBhbnl3aGVyZS4KICAgIENPTU1BTkRTPSQoZWNobyBcCiAgICAgICAgICAgICdzeXN0ZW1jdGwgZW5hYmxlIE5ldHdvcmtNYW5hZ2VyLnNlcnZpY2UgJiYnIFwKICAgICAgICAgICAgJ2h3Y2xvY2sgLS1zeXN0b2hjICYmJyBcCiAgICAgICAgICAgICd0aW1lZGF0ZWN0bCBzZXQtbnRwIHRydWUgJiYnIFwKICAgICAgICAgICAgJ2xvY2FsZS1nZW4gJiYnIFwKICAgICAgICAgICAgImVjaG8gJ3Jvb3Q6JFJPT1RfUEFTU1dPUkQnIHwgY2hwYXNzd2QgJiYiIFwKICAgICAgICAgICAgInVzZXJhZGQgJE1FRElBX0JPWF9VU0VSICYmIiBcCiAgICAgICAgICAgICJlY2hvICRNRURJQV9CT1hfVVNFUjokTUVESUFfQk9YX1BBU1NXT1JEIHwgY2hwYXNzd2QgJiYiIFwKICAgICAgICAgICAgIiRHUlVCX0lOU1RBTEwgJiYiIFwKICAgICAgICAgICAgJ21rZGlyIC1wIC9ib290L2dydWIgJiYnIFwKICAgICAgICAgICAgJ2dydWItbWtjb25maWcgLW8gL2Jvb3QvZ3J1Yi9ncnViLmNmZycpCiAgICAKICAgIGFyY2gtY2hyb290IC9tbnQvZ3Vlc3QgL2Jpbi9iYXNoIC1jICIkQ09NTUFORFMiCiAgICAKICAgIHJtIC9ydW4vaW5pdHJhbWZzL3NodXRkb3duCiAgICBjcCBjdXN0b20tc2h1dGRvd24gL3J1bi9pbml0cmFtZnMvc2h1dGRvd24KICAg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dWxkIGJlIHBlcmZvcm1lZC4gIFByb2JhYmx5CiMgbmV2ZXIgYW55IGdvb2QgcmVhc29uIHRvIHVwZGF0ZSB0aGlzLgpNQUlOX1BBUlRJVElPTj17e21haW4tcGFydGl0aW9ufX0KCiMgQWxsb3dzIHlvdSB0byBjaGFuZ2Ugd2hhdCB5b3UgaW5pdGlhbGx5IHNldCBkdXJpbmcgdGhlIGJvb3RzdHJhcCBwcm9jZXNzLgojIFdvbid0IHRha2UgZWZmZWN0IHVudGlsIHVwZGF0ZS4KSE9TVE5BTUU9e3tob3N0bmFtZX19Ck1FRElBX0JPWF9VU0VSPXt7bWVkaWEtYm94LXVzZXJ9fQoKIyBWYXJpYWJsZXMgdGhhdCBtYXRjaCBGU1RBQl9FTlRSWV8qIHdpbGwgYmUgYWRkZWQgdG8gL2V0Yy9mc3RhYiBvbiBib290LgojRlNUQUJfRU5UUllfWFlaPS4uLgoKVE9SUkVOVF9DT01QTEVURURfRElSRUNUT1JZPS9ob21lLyRNRURJQV9CT1hfVVNFUi9tZWRpYS9jb21wbGV0ZWQKVE9SUkVOVF9GSUxFX0RJUkVDVE9SWT0vaG9tZS8kTUVESUFfQk9YX1VTRVIvbWVkaWEvdG9ycmVudC1maWxlcwpUT1JSRU5UX0lOX1BST0dSRVNTX0RJUkVDVE9SWT0vaG9tZS8kTUVESUFfQk9YX1VTRVIvbWVkaWEvaW4tcHJvZ3Jlc3MKClNURUFNX0xJQlJBUllfRElSRUNUT1JZPS9ob21lLyRNRURJQV9CT1hfVVNFUi9zdGVhbS1hcHBzCgojIFZhcmlhYmxlcyB0aGF0IG1hdGNoIERBTkRBUFBfKiB3aWxsIGJlIGFkZGVkIHRvIHRoZSBhcHAgbWVudS4gIEZvcm1hdCBpczoKIyBsYWJlbDtzdWJsYWJlbDtiYXNoY29tbWFuZApEQU5EQVBQX05FVEZMSVg9J05ldGZsaXg7O3dlYi1hcHAgaHR0cHM6Ly93d3cubmV0ZmxpeC5jb20nCgojIEdldCBhIGxpc3Qgd2l0aDogcGFjbWQgbGlzdC1zaW5rcyB8IGdyZXAgJ25hbWU6JwojUFVMU0VfQVVESU9fREVGQVVMVF9TSU5LPWFzZGYKAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAuL2N1c3RvbS1zaHV0ZG93bgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMDAwMDY2NAAwMDAxNzUwADAwMDE3NTAAMDAwMDAwMDM0NDAAMTM3MTIxMjU3NTQAMDE0MjQzACAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHVzdGFyICAAaGFtcHRvcwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABoYW1wdG9zAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACMhL2Jpbi9hc2gKCiMgU2xpZ2h0IG1vZGlmaWNhdGlvbiBvZgojIGh0dHBzOi8vZ2l0bGFiLmFyY2hsaW51eC5vcmcvYXJjaGxpbnV4L2FyY2hpc28vLS9ibG9iL21hc3Rlci9hcmNoaXNvL2luaXRjcGlvL3NjcmlwdC9hcmNoaXNvX3NodXRkb3duCiMgdG8gcHJvdmlkZSBhIHBhdXNlIHRvIHJlbW92ZSBpbnN0YWxsYXRpb24gbWVkaWEuCgojIC9vbGRyb290IGRlcGVuZHMgb24gdGhpbmdzIGluc2lkZSAvb2xkcm9vdC9ydW4vYXJjaGlzby4uLgpta2RpciAvb2xkcnVuCm1vdW50IC1uIC0tbW92ZSAvb2xkcm9vdC9ydW4gL29sZHJ1bgoKIyBVbm1vdW50IGFsbCBtb3VudHMgbm93Lgp1bW91bnQgJChtb3VudCB8IGF3ayAnJDMgfi9eXC9vbGRyb290LyB7cHJpbnQgJDN9JyB8IHNvcnQgLXIpCgojIFJlbW92ZSBhbGwgZG0tc25hcHNob3QgZGV2aWNlcy4KZG1zZXR1cCByZW1vdmVfYWxsCgojIFJlbW92ZSBhbGwgbG9vcGJhY2sgZGV2aWNlcy4KZm9yIF9sdXAgaW4gJChncmVwIF4vZGV2L2xvb3AgL29sZHJ1bi9hcmNoaXNvL3VzZWRfYmxvY2tfZGV2aWNlcyB8IHRhYyk7IGRvCiAgICBpZiAhIGxvc2V0dXAgLWQgJHtfbHVwfSAyPiAvZGV2L251bGw7IHRoZW4KICAgICAgICB1bW91bnQgLWQgJHtfbHVwfQogICAgZmkKZG9uZQoKIyBVbm1vdW50IHRoZSBzcGFjZSB1c2VkIHRvIHN0b3JlICouY293Lgp1bW91bnQgL29sZHJ1bi9hcmNoaXNvL2Nvd3NwYWNlCgojIFVubW91bnQgYm9vdCBkZXZpY2UgaWYgbmVlZGVkIChubyBjb3B5dG9yYW09eSB1c2VkKQppZiBbWyAhIC1kIC9vbGRydW4vYXJjaGlzby9jb3B5dG9yYW0gXV07IHRoZW4KICAgIGlmIFtbIC1kIC9vbGRydW4vYXJjaGlzby9pbWdfZGV2IF1dOyB0aGVuCiAgICAgICAgdW1vdW50IC9vbGRydW4vYXJjaGlzby9pbWdfZGV2CiAgICBlbHNlCiAgICAgICAgdW1vdW50IC9vbGRydW4vYXJjaGlzby9ib290bW50CiAgICBmaQpmaQoKZWNobwplY2hvCmVjaG8gJyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIycKZWNobyAnIyMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMjJwplY2hvICcjIyBCb290c3RyYXAgY29tcGxldGUhICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyMnCmVjaG8gJyMjICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIycKZWNobyAnIyMgUmVtb3ZlIGluc3RhbGxhdGlvbiBtZWRpYSBhbmQgcHJlc3MgYW55IGtleSB0byByZWJvb3QgYW5kIGluc3RhbGwgICMjJwplY2hvICcjIyB0aGUgY3VycmVudCBzeXN0ZW0gdmVyc2lvbi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyMnCmVjaG8gJyMjICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIycKZWNobyAnIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjJwplY2hvCmVjaG8KCnJlYWQgLW4gMSAtciAtcyAtcCAkJycKCiMgcmVib290IC8gcG93ZXJvZmYgLyBoYWx0LCBkZXBlbmRpbmcgb24gdGhlIGFyZ3VtZW50IHBhc3NlZCBieSBpbml0CiMgaWYgc29tZXRoaW5nIGludmFsaWQgaXMgcGFzc2VkLCB3ZSBoYWx0CmNhc2UgIiQxIiBpbgogIHJlYm9vdHxwb3dlcm9mZnxoYWx0KSAiJDEiIC1mIDs7CiAgKikgaGFsdCAtZjs7CmVzYWMKCgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=' | base64 --decode | tar -C $TMP_DIR -xv
cd "$TMP_DIR"
./bootstrap.sh
