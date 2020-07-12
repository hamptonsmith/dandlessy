#!/bin/bash
TMP_DIR=$(mktemp -d)
echo 'Li8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAwMDA3NzUAMDAwMTc1MAAwMDAxNzUwADAwMDAwMDAwMDAwADEzNzAyNDc0MTU2ADAxMTEzNgAgNQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB1c3RhciAgAGhhbXB0b3MAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaGFtcHRvcwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAuL2RlZmF1bHQtZGFuZGxlc3N5LWNvbmZpZwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMDAwMDY2NAAwMDAxNzUwADAwMDE3NTAAMDAwMDAwMDE2NTcAMTM3MDI0MzQyNTQAMDE1NzQwACAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHVzdGFyICAAaGFtcHRvcwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABoYW1wdG9zAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACMgQXV0b3J1biB3aGVuIGJvb3RpbmcgaW50byB0aGUgdXBkYXRlIHBhcnRpdGlvbi4KVVBEQVRFX0NNRD0nZGFuZGxlc3N5LXVwZGF0ZScKCiMgU3BlY2lmaWVzIHRoZSBwYXJ0aXRpb24gZGV2aWNlIHdoZXJlIGluc3RhbGxzIHNob3VsZCBiZSBwZXJmb3JtZWQuICBQcm9iYWJseQojIG5ldmVyIGFueSBnb29kIHJlYXNvbiB0byB1cGRhdGUgdGhpcy4KTUFJTl9QQVJUSVRJT049e3ttYWluLXBhcnRpdGlvbn19CgojIEFsbG93cyB5b3UgdG8gY2hhbmdlIHdoYXQgeW91IGluaXRpYWxseSBzZXQgZHVyaW5nIHRoZSBib290c3RyYXAgcHJvY2Vzcy4KIyBXb24ndCB0YWtlIGVmZmVjdCB1bnRpbCB1cGRhdGUuCkhPU1ROQU1FPXt7aG9zdG5hbWV9fQpNRURJQV9CT1hfVVNFUj17e21lZGlhLWJveC11c2VyfX0KCiMgVmFyaWFibGVzIHRoYXQgbWF0Y2ggRlNUQUJfRU5UUllfKiB3aWxsIGJlIGFkZGVkIHRvIC9ldGMvZnN0YWIgb24gYm9vdC4KI0ZTVEFCX0VOVFJZX1hZWj0uLi4KClRPUlJFTlRfQ09NUExFVEVEX0RJUkVDVE9SWT0vaG9tZS8kTUVESUFfQk9YX1VTRVIvbWVkaWEvY29tcGxldGVkClRPUlJFTlRfRklMRV9ESVJFQ1RPUlk9L2hvbWUvJE1FRElBX0JPWF9VU0VSL21lZGlhL3RvcnJlbnQtZmlsZXMKVE9SUkVOVF9JTl9QUk9HUkVTU19ESVJFQ1RPUlk9L2hvbWUvJE1FRElBX0JPWF9VU0VSL21lZGlhL2luLXByb2dyZXNzCgpTVEVBTV9MSUJSQVJZX0RJUkVDVE9SWT0vaG9tZS8kTUVESUFfQk9YX1VTRVIvc3RlYW0tYXBwcwoKIyBWYXJpYWJsZXMgdGhhdCBtYXRjaCBEQU5EQVBQXyogd2lsbCBiZSBhZGRlZCB0byB0aGUgYXBwIG1lbnUuICBGb3JtYXQgaXM6CiMgbGFiZWw7c3VibGFiZWw7YmFzaGNvbW1hbmQKREFOREFQUF9ORVRGTElYPSdOZXRmbGl4Oztnb29nbGUtY2hyb21lLXN0YWJsZSAtLWtpb3NrIGh0dHBzOi8vd3d3Lm5ldGZsaXguY29tJwoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAuL2Jvb3RzdHJhcC5zaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMDAwMDc3NQAwMDAxNzUwADAwMDE3NTAAMDAwMDAwMTM1NTYAMTM3MDI0NzQxNTYAMDEzNTI0ACAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHVzdGFyICAAaGFtcHRvcwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABoYW1wdG9zAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACMhL2Jpbi9iYXNoCgojIENvbGxlY3QgaW5mbywgcGFydGl0aW9uLCBpbnN0YWxsIGdydWIsIGNyZWF0ZSBhIG1pbmltYWwgdXBkYXRlIGJvb3QKIyBwYXJ0aXRpb24sIHRoZW4gcmVib290IG9udG8gdGhhdCBwYXJ0aXRpb24gdG8gY29udGludWUgaW5zdGFsbC4KCmZ1bmN0aW9uIHJhbmRvbVNsdWcoKSB7CiAgICBjYXQgL2Rldi91cmFuZG9tIHwgdHIgLWRjICdhLXpBLVowLTknIHwgZm9sZCAtdyAkMSB8IGhlYWQgLW4gMQp9CgpmdW5jdGlvbiBkb0luc3RhbGwoKSB7CiAgICBzZXQgLWUKICAgIHNldCAteAogICAgCiAgICAjIEZvciBkZWJ1Z2dpbmcgcHVycG9zZSwgdXNlZnVsIHRvIGRvIGEgbGl0dGxlIGNsZWFudXAgaWYgdGhpcyBzY3JpcHQgZ290CiAgICAjIGhhbGYtcnVuLgogICAgCiAgICB1bW91bnQgL21udCAmPiAvZGV2L251bGwgfHwgdHJ1ZQogICAgdW1vdW50IC9tbnQvZm9zc2lsICY+IC9kZXYvbnVsbCB8fCB0cnVlCiAgICB1bW91bnQgL21udC9ndWVzdC9tbnQvZm9zc2lsICY+IC9kZXYvbnVsbCB8fCB0cnVlCiAgICB1bW91bnQgL21udC9ndWVzdCAmPiAvZGV2L251bGwgfHwgdHJ1ZQogICAgCiAgICBpZiAhIHBpbmcgZ29vZ2xlLmNvbSAtYzEgJj4gL2Rldi9udWxsOyB0aGVuCiAgICAgICAgZWNobyAiQ291bGRuJ3QgcmVhY2ggZ29vZ2xlLmNvbS4gIENpdmlsaXphdGlvbiBoYXMgZmFsbGVuIG9yIHRoZSIgXAogICAgICAgICAgICAgICAgIm5ldHdvcmsgaXNuJ3Qgd29ya2luZy4iCiAgICAgICAgZXhpdCAxCiAgICBmaQogICAgCiAgICB0aW1lZGF0ZWN0bCBzZXQtbnRwIHRydWUKICAgIAogICAgRFJJVkVfTElTVD0kKCBcCiAgICAgICAgICAgIGxzYmxrIC1kcGxueCBzaXplIC1vIG5hbWUsc2l6ZSB8IGdyZXAgLUV2ICJib290fHJwbWJ8bG9vcCIgfCB0YWMpCiAgICBEUklWRT0kKCBcCiAgICAgICAgICAgIGRpYWxvZyAtLXN0ZG91dCAtLW1lbnUgIlNlbGVjdCBpbnN0YWxsYXRpb24gZGlzayIgMCAwIDAgXAogICAgICAgICAgICAgICAgICAgICR7RFJJVkVfTElTVH0pIHx8IFwKICAgICAgICAgICAgZXhpdCAxCiAgICAKICAgIEhPU1ROQU1FPSQoZGlhbG9nIC0tc3Rkb3V0IC0taW5wdXRib3ggIkVudGVyIGhvc3RuYW1lIiAwIDApIHx8IGV4aXQgMQogICAgUk9PVF9QQVNTV09SRD0kKCBcCiAgICAgICAgICAgICAgICBkaWFsb2cgLS1zdGRvdXQgLS1pbnB1dGJveCAiRW50ZXIgcm9vdCBwYXNzd29yZCIgMCAwKSBcCiAgICAgICAgICAgICAgICB8fCBleGl0IDEKICAgIE1FRElBX0JPWF9VU0VSPSQoCiAgICAgICAgICAgIGRpYWxvZyAtLXN0ZG91dCAtLWlucHV0Ym94ICJFbnRlciBtZWRpYSBib3ggdXNlciBuYW1lIiAwIDApIFwKICAgICAgICAgICAgfHwgZXhpdCAxCiAgICBNRURJQV9CT1hfUEFTU1dPUkQ9JChkaWFsb2cgLS1zdGRvdXQgLS1pbnB1dGJveCBcCiAgICAgICAgICAgICJFbnRlciBtZWRpYSBib3ggdXNlciBwYXNzd29yZCIgMCAwKSBcCiAgICAgICAgICAgIHx8IGV4aXQgMSAgICAKICAgIAogICAgcGFydGVkIC0tc2NyaXB0ICIke0RSSVZFfSIgLS0gbWtsYWJlbCBncHQgXAogICAgICAgICAgICBta3BhcnQgIlwiR1JVQiBib290IHBhcnRpdGlvblwiIiBmYXQzMiAxTWliIDJNaWIgXAogICAgICAgICAgICBzZXQgMSBiaW9zX2dydWIgb24gXAogICAgICAgICAgICBta3BhcnQgIlwic3dhcCBwYXJ0aXRpb25cIiIgbGludXgtc3dhcCAyTWlCIDM4MTZNaUIgXAogICAgICAgICAgICBta3BhcnQgIlwiZm9zc2lsIHBhcnRpdGlvblwiIiBleHQ0IDM4MTZNaUIgNzYzMU1pQiBcCiAgICAgICAgICAgIG1rcGFydCAiXCJ1cGRhdGUgcGFydGl0aW9uXCIiIGV4dDQgNzYzMU1pQiAxMzM1M01pQiBcCiAgICAgICAgICAgIG1rcGFydCAiXCJtYWluIHBhcnRpdGlvblwiIiBleHQ0IDEzMzUzTWlCIDEwMCUKICAgIAogICAgbWtzd2FwICIke0RSSVZFfTIiCiAgICAKICAgIEZPU1NJTF9QQVJUSVRJT049IiR7RFJJVkV9MyIKICAgIFVQREFURV9QQVJUSVRJT049IiR7RFJJVkV9NCIKICAgIE1BSU5fUEFSVElUSU9OPSIke0RSSVZFfTUiCiAgICAKICAgIGlmIFtbICIkKGJsa2lkIC1zIFRZUEUgLW8gdmFsdWUgJEZPU1NJTF9QQVJUSVRJT04pIiAhPSAiZXh0NCIgXV07IHRoZW4KICAgICAgICBta2ZzLmV4dDQgLUYgIiRGT1NTSUxfUEFSVElUSU9OIgogICAgZWxzZQogICAgICAgICMgSWYgd2UgaGFwcGVuIHRvIGhhdmUgYSBwYWNtYW4tY2FjaGUsIGxldCdzIGtlZXAgaXQgdG8gc2F2ZSBzb21lIHRpbWUsCiAgICAgICAgIyBidXQgZGVsZXRlIGV2ZXJ5dGhpbmcgZWxzZS4KICAgICAgICAKICAgICAgICBta2RpciAtcCAvbW50L2Zvc3NpbAogICAgICAgIG1vdW50ICIkRk9TU0lMX1BBUlRJVElPTiIgL21udC9mb3NzaWwKICAgICAgICAKICAgICAgICBmb3IgTk9ERSBpbiAvbW50L2Zvc3NpbC8qOyBkbwogICAgICAgICAgICBpZiBbWyAiJE5PREUiICE9ICIvbW50L2Zvc3NpbC9wYWNtYW4tY2FjaGUiIF1dOyB0aGVuCiAgICAgICAgICAgICAgICBybSAtcmYgIiROT0RFIgogICAgICAgICAgICBmaQogICAgICAgIGRvbmUKICAgICAgICAKICAgICAgICB1bW91bnQgL21udC9mb3NzaWwKICAgIGZpCiAgICAKICAgIG1rZnMuZXh0NCAtRiAiJFVQREFURV9QQVJUSVRJT04iCgogICAgbWtkaXIgLXAgL21udC9mb3NzaWwKICAgIG1vdW50ICIkRk9TU0lMX1BBUlRJVElPTiIgL21udC9mb3NzaWwKICAgIG1rZGlyIC1wIC9tbnQvZm9zc2lsL3BhY21hbi1jYWNoZQogICAgCiAgICBjcCBkZWZhdWx0LWRhbmRsZXNzeS1jb25maWcgL21udC9mb3NzaWwvZGFuZGxlc3N5LWNvbmZpZwogICAgCiAgICBzZWQgLWkgInMve3tob3N0bmFtZX19LyRIT1NUTkFNRS9nIiAvbW50L2Zvc3NpbC9kYW5kbGVzc3ktY29uZmlnCiAgICAgICAgCiAgICBzZWQgLWkgInN8e3ttYWluLXBhcnRpdGlvbn19fCRNQUlOX1BBUlRJVElPTnxnIiBcCiAgICAgICAgICAgIC9tbnQvZm9zc2lsL2RhbmRsZXNzeS1jb25maWcKCiAgICBzZWQgLWkgInMve3ttZWRpYS1ib3gtdXNlcn19LyRNRURJQV9CT1hfVVNFUi9nIiBcCiAgICAgICAgICAgIC9tbnQvZm9zc2lsL2RhbmRsZXNzeS1jb25maWcKICAgIAogICAgbWtkaXIgLXAgL21udC9ndWVzdAogICAgbW91bnQgIiRVUERBVEVfUEFSVElUSU9OIiAvbW50L2d1ZXN0CiAgICAKICAgIHBhY3N0cmFwIC1jIC9tbnQvZ3Vlc3QgLS1jYWNoZWRpciAiL21udC9mb3NzaWwvcGFjbWFuLWNhY2hlIiBcCiAgICAgICAgICAgIGFyY2gtaW5zdGFsbC1zY3JpcHRzIGJhc2UgZ3J1YiBsaW51eCBsaW51eC1maXJtd2FyZSBuZXR3b3JrbWFuYWdlciBcCiAgICAgICAgICAgIG9zLXByb2JlciB3Z2V0CiAgICAKICAgIFVQRF9IT1NUTkFNRT0kKHJhbmRvbVNsdWcgMTApCiAgICBlY2hvICIkVVBEX0hPU1ROQU1FIiA+IC9tbnQvZ3Vlc3QvZXRjL2hvc3RuYW1lCiAgICAKICAgIGdlbmZzdGFiIC1VIC9tbnQvZ3Vlc3QgPj4gL21udC9ndWVzdC9ldGMvZnN0YWIKICAgIAogICAgRk9TU0lMX1BBUlRJVElPTl9VVUlEPSQoYmxraWQgLXMgVVVJRCAtbyB2YWx1ZSAiJEZPU1NJTF9QQVJUSVRJT04iKQogICAgZWNobyAiVVVJRD0kRk9TU0lMX1BBUlRJVElPTl9VVUlEIC9tbnQvZm9zc2lsIGV4dDQgZGVmYXVsdHMgMCAyIiBcCiAgICAgICAgICAgID4+IC9tbnQvZ3Vlc3QvZXRjL2ZzdGFiCiAgICBta2RpciAtcCAvbW50L2d1ZXN0L21udC9mb3NzaWwKICAgIAogICAgVVBEX0hPU1RTPScvbW50L2d1ZXN0L2V0Yy9ob3N0cycKICAgIGVjaG8gJzEyNy4wLjAuMSBsb2NhbGhvc3QnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA+ICIkVVBEX0hPU1RTIgogICAgZWNobyAnOjoxJyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPj4gIiRVUERfSE9TVFMiCiAgICBlY2hvICIxMjcuMC4xLjEgJFVQRF9IT1NUTkFNRS5sb2NhbGRvbWFpbiAkVVBEX0hPU1ROQU1FIiA+PiAiJFVQRF9IT1NUUyIKICAgIAogICAgR0VUVFlfUEFUSD0nL21udC9ndWVzdC9ldGMvc3lzdGVtZC9zeXN0ZW0vZ2V0dHlAdHR5MS5zZXJ2aWNlLmQnCiAgICBta2RpciAtcCAiJEdFVFRZX1BBVEgiCiAgICAKICAgIEdFVFRZX0NPTkY9IiRHRVRUWV9QQVRIL2F1dG9sb2dpbi5jb25mIgogICAgZWNobyAnW1NlcnZpY2VdJyA+ICIkR0VUVFlfQ09ORiIKICAgIGVjaG8gJ0V4ZWNTdGFydD0nID4+ICIkR0VUVFlfQ09ORiIKICAgIGVjaG8gJ0V4ZWNTdGFydD0tL3Vzci9iaW4vYWdldHR5JyBcCiAgICAgICAgICAgICctLWF1dG9sb2dpbiByb290IC0tbm9jbGVhciAlSSAzODQwMCBsaW51eCcgPj4gIiRHRVRUWV9DT05GIgogICAgCiAgICBjcCBkYW5kbGVzc3ktdXBkYXRlIC9tbnQvZ3Vlc3QvdXNyL2Jpbi9kYW5kbGVzc3ktdXBkYXRlCiAgICBjaG1vZCBhK3ggL21udC9ndWVzdC91c3IvYmluL2RhbmRsZXNzeS11cGRhdGUKICAgIAogICAgZWNobyAnZGFuZGxlc3N5LXVwZGF0ZScgPj4gL21udC9ndWVzdC9yb290Ly5wcm9maWxlCiAgICAKICAgIGxuIC1zZiAvbW50L2d1ZXN0L3Vzci9zaGFyZS96b25laW5mby9VUy9FYXN0ZXJuIC9tbnQvZ3Vlc3QvZXRjL2xvY2FsdGltZQogICAgc2VkIC1pICJzLyNlbl9VUy5VVEYtOCBVVEYtOC9lbl9VUy5VVEYtOCBVVEYtOC9nIiAvbW50L2d1ZXN0L2V0Yy9sb2NhbGUuZ2VuCiAgICAKICAgIGVjaG8gJ0xBTkc9ZW5fVVMuVVRGLTgnID4gL21udC9ndWVzdC9ldGMvbG9jYWxlLmNvbmYKICAgIAogICAgc2VkIC1pICdzfCNDYWNoZURpciAqPS4qfENhY2hlRGlyPS9tbnQvZm9zc2lsL3BhY21hbi1jYWNoZS98ZycgXAogICAgICAgICAgICAvbW50L2d1ZXN0L2V0Yy9wYWNtYW4uY29uZgogICAgCiAgICAjIFdlIG5lZWQgYSBzbGlnaHRseSBkaWZmZXJlbnQgR1JVQiBpbnN0YWxsIGJhc2VkIG9uIEJJT1MgdnMuIFVFRkkuCiAgICBpZiBscyAvc3lzL2Zpcm13YXJlL2VmaS9lZml2YXJzICY+IC9kZXYvbnVsbDsgdGhlbgogICAgICAgICMgVUVGSQogICAgICAgIGVjaG8gJ1VFRkkgbm90IGN1cnJlbnRseSBzdXBwb3J0ZWQuJwogICAgICAgIGV4aXQgMQogICAgZWxzZQogICAgICAgICMgQklPUwogICAgICAgIEdSVUJfSU5TVEFMTD0iZ3J1Yi1pbnN0YWxsIC0tdGFyZ2V0PWkzODYtcGMgJERSSVZFIgogICAgZmkKICAgIAogICAgIyBXZSBjcmVhdGUgdXNlcnMgYW5kIHNldCBwYXNzd29yZHMgc3BlY2lmaWNhbGx5IHRvIGdlbmVyYXRlIGEgc2Vuc2libGUKICAgICMgL2V0Yy9zaGFkb3cgZmlsZSB3aXRoIHdoaWNoIHRvIHNlZWQgdGhlIGxpdmUgc3lzdGVtIHNvIHdlIGRvbid0IGhhdmUgdG8KICAgICMgc3RvcmUgcGxhaW50ZXh0IHBhc3N3b3JkcyBhbnl3aGVyZS4KICAgIENPTU1BTkRTPSQoZWNobyBcCiAgICAgICAgICAgICdzeXN0ZW1jdGwgZW5hYmxlIE5ldHdvcmtNYW5hZ2VyLnNlcnZpY2UgJiYnIFwKICAgICAgICAgICAgJ2h3Y2xvY2sgLS1zeXN0b2hjICYmJyBcCiAgICAgICAgICAgICd0aW1lZGF0ZWN0bCBzZXQtbnRwIHRydWUgJiYnIFwKICAgICAgICAgICAgJ2xvY2FsZS1nZW4gJiYnIFwKICAgICAgICAgICAgImVjaG8gJ3Jvb3Q6JFJPT1RfUEFTU1dPUkQnIHwgY2hwYXNz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ZiAhIGxvc2V0dXAgLWQgJHtfbHVwfSAyPiAvZGV2L251bGw7IHRoZW4KICAgICAgICB1bW91bnQgLWQgJHtfbHVwfQogICAgZmkKZG9uZQoKIyBVbm1vdW50IHRoZSBzcGFjZSB1c2VkIHRvIHN0b3JlICouY293Lgp1bW91bnQgL29sZHJ1bi9hcmNoaXNvL2Nvd3NwYWNlCgojIFVubW91bnQgYm9vdCBkZXZpY2UgaWYgbmVlZGVkIChubyBjb3B5dG9yYW09eSB1c2VkKQppZiBbWyAhIC1kIC9vbGRydW4vYXJjaGlzby9jb3B5dG9yYW0gXV07IHRoZW4KICAgIGlmIFtbIC1kIC9vbGRydW4vYXJjaGlzby9pbWdfZGV2IF1dOyB0aGVuCiAgICAgICAgdW1vdW50IC9vbGRydW4vYXJjaGlzby9pbWdfZGV2CiAgICBlbHNlCiAgICAgICAgdW1vdW50IC9vbGRydW4vYXJjaGlzby9ib290bW50CiAgICBmaQpmaQoKZWNobwplY2hvCmVjaG8gJyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIycKZWNobyAnIyMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMjJwplY2hvICcjIyBCb290c3RyYXAgY29tcGxldGUhICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyMnCmVjaG8gJyMjICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIycKZWNobyAnIyMgUmVtb3ZlIGluc3RhbGxhdGlvbiBtZWRpYSBhbmQgcHJlc3MgYW55IGtleSB0byByZWJvb3QgYW5kIGluc3RhbGwgICMjJwplY2hvICcjIyB0aGUgY3VycmVudCBzeXN0ZW0gdmVyc2lvbi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyMnCmVjaG8gJyMjICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIycKZWNobyAnIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjJwplY2hvCmVjaG8KCnJlYWQgLW4gMSAtciAtcyAtcCAkJycKCiMgcmVib290IC8gcG93ZXJvZmYgLyBoYWx0LCBkZXBlbmRpbmcgb24gdGhlIGFyZ3VtZW50IHBhc3NlZCBieSBpbml0CiMgaWYgc29tZXRoaW5nIGludmFsaWQgaXMgcGFzc2VkLCB3ZSBoYWx0CmNhc2UgIiQxIiBpbgogIHJlYm9vdHxwb3dlcm9mZnxoYWx0KSAiJDEiIC1mIDs7CiAgKikgaGFsdCAtZjs7CmVzYWMKCgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=' | base64 --decode | tar -C $TMP_DIR -xv
cd "$TMP_DIR"
./bootstrap.sh
