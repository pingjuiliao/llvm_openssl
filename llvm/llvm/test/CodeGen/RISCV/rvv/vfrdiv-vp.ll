; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+d,+zfh,+experimental-zvfh,+v -target-abi=ilp32d \
; RUN:     -verify-machineinstrs < %s | FileCheck %s
; RUN: llc -mtriple=riscv64 -mattr=+d,+zfh,+experimental-zvfh,+v -target-abi=lp64d \
; RUN:     -verify-machineinstrs < %s | FileCheck %s

declare <vscale x 1 x half> @llvm.vp.fdiv.nxv1f16(<vscale x 1 x half>, <vscale x 1 x half>, <vscale x 1 x i1>, i32)

define <vscale x 1 x half> @vfrdiv_vf_nxv1f16(<vscale x 1 x half> %va, half %b, <vscale x 1 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv1f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, mf4, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0, v0.t
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 1 x half> poison, half %b, i32 0
  %vb = shufflevector <vscale x 1 x half> %elt.head, <vscale x 1 x half> poison, <vscale x 1 x i32> zeroinitializer
  %v = call <vscale x 1 x half> @llvm.vp.fdiv.nxv1f16(<vscale x 1 x half> %vb, <vscale x 1 x half> %va, <vscale x 1 x i1> %m, i32 %evl)
  ret <vscale x 1 x half> %v
}

define <vscale x 1 x half> @vfrdiv_vf_nxv1f16_unmasked(<vscale x 1 x half> %va, half %b, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv1f16_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, mf4, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 1 x half> poison, half %b, i32 0
  %vb = shufflevector <vscale x 1 x half> %elt.head, <vscale x 1 x half> poison, <vscale x 1 x i32> zeroinitializer
  %head = insertelement <vscale x 1 x i1> poison, i1 true, i32 0
  %m = shufflevector <vscale x 1 x i1> %head, <vscale x 1 x i1> poison, <vscale x 1 x i32> zeroinitializer
  %v = call <vscale x 1 x half> @llvm.vp.fdiv.nxv1f16(<vscale x 1 x half> %vb, <vscale x 1 x half> %va, <vscale x 1 x i1> %m, i32 %evl)
  ret <vscale x 1 x half> %v
}

declare <vscale x 2 x half> @llvm.vp.fdiv.nxv2f16(<vscale x 2 x half>, <vscale x 2 x half>, <vscale x 2 x i1>, i32)

define <vscale x 2 x half> @vfrdiv_vf_nxv2f16(<vscale x 2 x half> %va, half %b, <vscale x 2 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv2f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, mf2, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0, v0.t
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 2 x half> poison, half %b, i32 0
  %vb = shufflevector <vscale x 2 x half> %elt.head, <vscale x 2 x half> poison, <vscale x 2 x i32> zeroinitializer
  %v = call <vscale x 2 x half> @llvm.vp.fdiv.nxv2f16(<vscale x 2 x half> %vb, <vscale x 2 x half> %va, <vscale x 2 x i1> %m, i32 %evl)
  ret <vscale x 2 x half> %v
}

define <vscale x 2 x half> @vfrdiv_vf_nxv2f16_unmasked(<vscale x 2 x half> %va, half %b, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv2f16_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, mf2, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 2 x half> poison, half %b, i32 0
  %vb = shufflevector <vscale x 2 x half> %elt.head, <vscale x 2 x half> poison, <vscale x 2 x i32> zeroinitializer
  %head = insertelement <vscale x 2 x i1> poison, i1 true, i32 0
  %m = shufflevector <vscale x 2 x i1> %head, <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer
  %v = call <vscale x 2 x half> @llvm.vp.fdiv.nxv2f16(<vscale x 2 x half> %vb, <vscale x 2 x half> %va, <vscale x 2 x i1> %m, i32 %evl)
  ret <vscale x 2 x half> %v
}

declare <vscale x 4 x half> @llvm.vp.fdiv.nxv4f16(<vscale x 4 x half>, <vscale x 4 x half>, <vscale x 4 x i1>, i32)

define <vscale x 4 x half> @vfrdiv_vf_nxv4f16(<vscale x 4 x half> %va, half %b, <vscale x 4 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv4f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, m1, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0, v0.t
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 4 x half> poison, half %b, i32 0
  %vb = shufflevector <vscale x 4 x half> %elt.head, <vscale x 4 x half> poison, <vscale x 4 x i32> zeroinitializer
  %v = call <vscale x 4 x half> @llvm.vp.fdiv.nxv4f16(<vscale x 4 x half> %vb, <vscale x 4 x half> %va, <vscale x 4 x i1> %m, i32 %evl)
  ret <vscale x 4 x half> %v
}

define <vscale x 4 x half> @vfrdiv_vf_nxv4f16_unmasked(<vscale x 4 x half> %va, half %b, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv4f16_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, m1, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 4 x half> poison, half %b, i32 0
  %vb = shufflevector <vscale x 4 x half> %elt.head, <vscale x 4 x half> poison, <vscale x 4 x i32> zeroinitializer
  %head = insertelement <vscale x 4 x i1> poison, i1 true, i32 0
  %m = shufflevector <vscale x 4 x i1> %head, <vscale x 4 x i1> poison, <vscale x 4 x i32> zeroinitializer
  %v = call <vscale x 4 x half> @llvm.vp.fdiv.nxv4f16(<vscale x 4 x half> %vb, <vscale x 4 x half> %va, <vscale x 4 x i1> %m, i32 %evl)
  ret <vscale x 4 x half> %v
}

declare <vscale x 8 x half> @llvm.vp.fdiv.nxv8f16(<vscale x 8 x half>, <vscale x 8 x half>, <vscale x 8 x i1>, i32)

define <vscale x 8 x half> @vfrdiv_vf_nxv8f16(<vscale x 8 x half> %va, half %b, <vscale x 8 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv8f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, m2, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0, v0.t
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 8 x half> poison, half %b, i32 0
  %vb = shufflevector <vscale x 8 x half> %elt.head, <vscale x 8 x half> poison, <vscale x 8 x i32> zeroinitializer
  %v = call <vscale x 8 x half> @llvm.vp.fdiv.nxv8f16(<vscale x 8 x half> %vb, <vscale x 8 x half> %va, <vscale x 8 x i1> %m, i32 %evl)
  ret <vscale x 8 x half> %v
}

define <vscale x 8 x half> @vfrdiv_vf_nxv8f16_unmasked(<vscale x 8 x half> %va, half %b, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv8f16_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, m2, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 8 x half> poison, half %b, i32 0
  %vb = shufflevector <vscale x 8 x half> %elt.head, <vscale x 8 x half> poison, <vscale x 8 x i32> zeroinitializer
  %head = insertelement <vscale x 8 x i1> poison, i1 true, i32 0
  %m = shufflevector <vscale x 8 x i1> %head, <vscale x 8 x i1> poison, <vscale x 8 x i32> zeroinitializer
  %v = call <vscale x 8 x half> @llvm.vp.fdiv.nxv8f16(<vscale x 8 x half> %vb, <vscale x 8 x half> %va, <vscale x 8 x i1> %m, i32 %evl)
  ret <vscale x 8 x half> %v
}

declare <vscale x 16 x half> @llvm.vp.fdiv.nxv16f16(<vscale x 16 x half>, <vscale x 16 x half>, <vscale x 16 x i1>, i32)

define <vscale x 16 x half> @vfrdiv_vf_nxv16f16(<vscale x 16 x half> %va, half %b, <vscale x 16 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv16f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, m4, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0, v0.t
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 16 x half> poison, half %b, i32 0
  %vb = shufflevector <vscale x 16 x half> %elt.head, <vscale x 16 x half> poison, <vscale x 16 x i32> zeroinitializer
  %v = call <vscale x 16 x half> @llvm.vp.fdiv.nxv16f16(<vscale x 16 x half> %vb, <vscale x 16 x half> %va, <vscale x 16 x i1> %m, i32 %evl)
  ret <vscale x 16 x half> %v
}

define <vscale x 16 x half> @vfrdiv_vf_nxv16f16_unmasked(<vscale x 16 x half> %va, half %b, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv16f16_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, m4, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 16 x half> poison, half %b, i32 0
  %vb = shufflevector <vscale x 16 x half> %elt.head, <vscale x 16 x half> poison, <vscale x 16 x i32> zeroinitializer
  %head = insertelement <vscale x 16 x i1> poison, i1 true, i32 0
  %m = shufflevector <vscale x 16 x i1> %head, <vscale x 16 x i1> poison, <vscale x 16 x i32> zeroinitializer
  %v = call <vscale x 16 x half> @llvm.vp.fdiv.nxv16f16(<vscale x 16 x half> %vb, <vscale x 16 x half> %va, <vscale x 16 x i1> %m, i32 %evl)
  ret <vscale x 16 x half> %v
}

declare <vscale x 32 x half> @llvm.vp.fdiv.nxv32f16(<vscale x 32 x half>, <vscale x 32 x half>, <vscale x 32 x i1>, i32)

define <vscale x 32 x half> @vfrdiv_vf_nxv32f16(<vscale x 32 x half> %va, half %b, <vscale x 32 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv32f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, m8, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0, v0.t
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 32 x half> poison, half %b, i32 0
  %vb = shufflevector <vscale x 32 x half> %elt.head, <vscale x 32 x half> poison, <vscale x 32 x i32> zeroinitializer
  %v = call <vscale x 32 x half> @llvm.vp.fdiv.nxv32f16(<vscale x 32 x half> %vb, <vscale x 32 x half> %va, <vscale x 32 x i1> %m, i32 %evl)
  ret <vscale x 32 x half> %v
}

define <vscale x 32 x half> @vfrdiv_vf_nxv32f16_unmasked(<vscale x 32 x half> %va, half %b, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv32f16_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, m8, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 32 x half> poison, half %b, i32 0
  %vb = shufflevector <vscale x 32 x half> %elt.head, <vscale x 32 x half> poison, <vscale x 32 x i32> zeroinitializer
  %head = insertelement <vscale x 32 x i1> poison, i1 true, i32 0
  %m = shufflevector <vscale x 32 x i1> %head, <vscale x 32 x i1> poison, <vscale x 32 x i32> zeroinitializer
  %v = call <vscale x 32 x half> @llvm.vp.fdiv.nxv32f16(<vscale x 32 x half> %vb, <vscale x 32 x half> %va, <vscale x 32 x i1> %m, i32 %evl)
  ret <vscale x 32 x half> %v
}

declare <vscale x 1 x float> @llvm.vp.fdiv.nxv1f32(<vscale x 1 x float>, <vscale x 1 x float>, <vscale x 1 x i1>, i32)

define <vscale x 1 x float> @vfrdiv_vf_nxv1f32(<vscale x 1 x float> %va, float %b, <vscale x 1 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv1f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, mf2, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0, v0.t
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 1 x float> poison, float %b, i32 0
  %vb = shufflevector <vscale x 1 x float> %elt.head, <vscale x 1 x float> poison, <vscale x 1 x i32> zeroinitializer
  %v = call <vscale x 1 x float> @llvm.vp.fdiv.nxv1f32(<vscale x 1 x float> %vb, <vscale x 1 x float> %va, <vscale x 1 x i1> %m, i32 %evl)
  ret <vscale x 1 x float> %v
}

define <vscale x 1 x float> @vfrdiv_vf_nxv1f32_unmasked(<vscale x 1 x float> %va, float %b, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv1f32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, mf2, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 1 x float> poison, float %b, i32 0
  %vb = shufflevector <vscale x 1 x float> %elt.head, <vscale x 1 x float> poison, <vscale x 1 x i32> zeroinitializer
  %head = insertelement <vscale x 1 x i1> poison, i1 true, i32 0
  %m = shufflevector <vscale x 1 x i1> %head, <vscale x 1 x i1> poison, <vscale x 1 x i32> zeroinitializer
  %v = call <vscale x 1 x float> @llvm.vp.fdiv.nxv1f32(<vscale x 1 x float> %vb, <vscale x 1 x float> %va, <vscale x 1 x i1> %m, i32 %evl)
  ret <vscale x 1 x float> %v
}

declare <vscale x 2 x float> @llvm.vp.fdiv.nxv2f32(<vscale x 2 x float>, <vscale x 2 x float>, <vscale x 2 x i1>, i32)

define <vscale x 2 x float> @vfrdiv_vf_nxv2f32(<vscale x 2 x float> %va, float %b, <vscale x 2 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv2f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0, v0.t
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 2 x float> poison, float %b, i32 0
  %vb = shufflevector <vscale x 2 x float> %elt.head, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %v = call <vscale x 2 x float> @llvm.vp.fdiv.nxv2f32(<vscale x 2 x float> %vb, <vscale x 2 x float> %va, <vscale x 2 x i1> %m, i32 %evl)
  ret <vscale x 2 x float> %v
}

define <vscale x 2 x float> @vfrdiv_vf_nxv2f32_unmasked(<vscale x 2 x float> %va, float %b, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv2f32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 2 x float> poison, float %b, i32 0
  %vb = shufflevector <vscale x 2 x float> %elt.head, <vscale x 2 x float> poison, <vscale x 2 x i32> zeroinitializer
  %head = insertelement <vscale x 2 x i1> poison, i1 true, i32 0
  %m = shufflevector <vscale x 2 x i1> %head, <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer
  %v = call <vscale x 2 x float> @llvm.vp.fdiv.nxv2f32(<vscale x 2 x float> %vb, <vscale x 2 x float> %va, <vscale x 2 x i1> %m, i32 %evl)
  ret <vscale x 2 x float> %v
}

declare <vscale x 4 x float> @llvm.vp.fdiv.nxv4f32(<vscale x 4 x float>, <vscale x 4 x float>, <vscale x 4 x i1>, i32)

define <vscale x 4 x float> @vfrdiv_vf_nxv4f32(<vscale x 4 x float> %va, float %b, <vscale x 4 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv4f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m2, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0, v0.t
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 4 x float> poison, float %b, i32 0
  %vb = shufflevector <vscale x 4 x float> %elt.head, <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer
  %v = call <vscale x 4 x float> @llvm.vp.fdiv.nxv4f32(<vscale x 4 x float> %vb, <vscale x 4 x float> %va, <vscale x 4 x i1> %m, i32 %evl)
  ret <vscale x 4 x float> %v
}

define <vscale x 4 x float> @vfrdiv_vf_nxv4f32_unmasked(<vscale x 4 x float> %va, float %b, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv4f32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m2, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 4 x float> poison, float %b, i32 0
  %vb = shufflevector <vscale x 4 x float> %elt.head, <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer
  %head = insertelement <vscale x 4 x i1> poison, i1 true, i32 0
  %m = shufflevector <vscale x 4 x i1> %head, <vscale x 4 x i1> poison, <vscale x 4 x i32> zeroinitializer
  %v = call <vscale x 4 x float> @llvm.vp.fdiv.nxv4f32(<vscale x 4 x float> %vb, <vscale x 4 x float> %va, <vscale x 4 x i1> %m, i32 %evl)
  ret <vscale x 4 x float> %v
}

declare <vscale x 8 x float> @llvm.vp.fdiv.nxv8f32(<vscale x 8 x float>, <vscale x 8 x float>, <vscale x 8 x i1>, i32)

define <vscale x 8 x float> @vfrdiv_vf_nxv8f32(<vscale x 8 x float> %va, float %b, <vscale x 8 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv8f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m4, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0, v0.t
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 8 x float> poison, float %b, i32 0
  %vb = shufflevector <vscale x 8 x float> %elt.head, <vscale x 8 x float> poison, <vscale x 8 x i32> zeroinitializer
  %v = call <vscale x 8 x float> @llvm.vp.fdiv.nxv8f32(<vscale x 8 x float> %vb, <vscale x 8 x float> %va, <vscale x 8 x i1> %m, i32 %evl)
  ret <vscale x 8 x float> %v
}

define <vscale x 8 x float> @vfrdiv_vf_nxv8f32_unmasked(<vscale x 8 x float> %va, float %b, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv8f32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m4, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 8 x float> poison, float %b, i32 0
  %vb = shufflevector <vscale x 8 x float> %elt.head, <vscale x 8 x float> poison, <vscale x 8 x i32> zeroinitializer
  %head = insertelement <vscale x 8 x i1> poison, i1 true, i32 0
  %m = shufflevector <vscale x 8 x i1> %head, <vscale x 8 x i1> poison, <vscale x 8 x i32> zeroinitializer
  %v = call <vscale x 8 x float> @llvm.vp.fdiv.nxv8f32(<vscale x 8 x float> %vb, <vscale x 8 x float> %va, <vscale x 8 x i1> %m, i32 %evl)
  ret <vscale x 8 x float> %v
}

declare <vscale x 16 x float> @llvm.vp.fdiv.nxv16f32(<vscale x 16 x float>, <vscale x 16 x float>, <vscale x 16 x i1>, i32)

define <vscale x 16 x float> @vfrdiv_vf_nxv16f32(<vscale x 16 x float> %va, float %b, <vscale x 16 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv16f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m8, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0, v0.t
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 16 x float> poison, float %b, i32 0
  %vb = shufflevector <vscale x 16 x float> %elt.head, <vscale x 16 x float> poison, <vscale x 16 x i32> zeroinitializer
  %v = call <vscale x 16 x float> @llvm.vp.fdiv.nxv16f32(<vscale x 16 x float> %vb, <vscale x 16 x float> %va, <vscale x 16 x i1> %m, i32 %evl)
  ret <vscale x 16 x float> %v
}

define <vscale x 16 x float> @vfrdiv_vf_nxv16f32_unmasked(<vscale x 16 x float> %va, float %b, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv16f32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m8, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 16 x float> poison, float %b, i32 0
  %vb = shufflevector <vscale x 16 x float> %elt.head, <vscale x 16 x float> poison, <vscale x 16 x i32> zeroinitializer
  %head = insertelement <vscale x 16 x i1> poison, i1 true, i32 0
  %m = shufflevector <vscale x 16 x i1> %head, <vscale x 16 x i1> poison, <vscale x 16 x i32> zeroinitializer
  %v = call <vscale x 16 x float> @llvm.vp.fdiv.nxv16f32(<vscale x 16 x float> %vb, <vscale x 16 x float> %va, <vscale x 16 x i1> %m, i32 %evl)
  ret <vscale x 16 x float> %v
}

declare <vscale x 1 x double> @llvm.vp.fdiv.nxv1f64(<vscale x 1 x double>, <vscale x 1 x double>, <vscale x 1 x i1>, i32)

define <vscale x 1 x double> @vfrdiv_vf_nxv1f64(<vscale x 1 x double> %va, double %b, <vscale x 1 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv1f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m1, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0, v0.t
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 1 x double> poison, double %b, i32 0
  %vb = shufflevector <vscale x 1 x double> %elt.head, <vscale x 1 x double> poison, <vscale x 1 x i32> zeroinitializer
  %v = call <vscale x 1 x double> @llvm.vp.fdiv.nxv1f64(<vscale x 1 x double> %vb, <vscale x 1 x double> %va, <vscale x 1 x i1> %m, i32 %evl)
  ret <vscale x 1 x double> %v
}

define <vscale x 1 x double> @vfrdiv_vf_nxv1f64_unmasked(<vscale x 1 x double> %va, double %b, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv1f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m1, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 1 x double> poison, double %b, i32 0
  %vb = shufflevector <vscale x 1 x double> %elt.head, <vscale x 1 x double> poison, <vscale x 1 x i32> zeroinitializer
  %head = insertelement <vscale x 1 x i1> poison, i1 true, i32 0
  %m = shufflevector <vscale x 1 x i1> %head, <vscale x 1 x i1> poison, <vscale x 1 x i32> zeroinitializer
  %v = call <vscale x 1 x double> @llvm.vp.fdiv.nxv1f64(<vscale x 1 x double> %vb, <vscale x 1 x double> %va, <vscale x 1 x i1> %m, i32 %evl)
  ret <vscale x 1 x double> %v
}

declare <vscale x 2 x double> @llvm.vp.fdiv.nxv2f64(<vscale x 2 x double>, <vscale x 2 x double>, <vscale x 2 x i1>, i32)

define <vscale x 2 x double> @vfrdiv_vf_nxv2f64(<vscale x 2 x double> %va, double %b, <vscale x 2 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv2f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m2, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0, v0.t
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 2 x double> poison, double %b, i32 0
  %vb = shufflevector <vscale x 2 x double> %elt.head, <vscale x 2 x double> poison, <vscale x 2 x i32> zeroinitializer
  %v = call <vscale x 2 x double> @llvm.vp.fdiv.nxv2f64(<vscale x 2 x double> %vb, <vscale x 2 x double> %va, <vscale x 2 x i1> %m, i32 %evl)
  ret <vscale x 2 x double> %v
}

define <vscale x 2 x double> @vfrdiv_vf_nxv2f64_unmasked(<vscale x 2 x double> %va, double %b, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv2f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m2, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 2 x double> poison, double %b, i32 0
  %vb = shufflevector <vscale x 2 x double> %elt.head, <vscale x 2 x double> poison, <vscale x 2 x i32> zeroinitializer
  %head = insertelement <vscale x 2 x i1> poison, i1 true, i32 0
  %m = shufflevector <vscale x 2 x i1> %head, <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer
  %v = call <vscale x 2 x double> @llvm.vp.fdiv.nxv2f64(<vscale x 2 x double> %vb, <vscale x 2 x double> %va, <vscale x 2 x i1> %m, i32 %evl)
  ret <vscale x 2 x double> %v
}

declare <vscale x 4 x double> @llvm.vp.fdiv.nxv4f64(<vscale x 4 x double>, <vscale x 4 x double>, <vscale x 4 x i1>, i32)

define <vscale x 4 x double> @vfrdiv_vf_nxv4f64(<vscale x 4 x double> %va, double %b, <vscale x 4 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv4f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m4, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0, v0.t
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 4 x double> poison, double %b, i32 0
  %vb = shufflevector <vscale x 4 x double> %elt.head, <vscale x 4 x double> poison, <vscale x 4 x i32> zeroinitializer
  %v = call <vscale x 4 x double> @llvm.vp.fdiv.nxv4f64(<vscale x 4 x double> %vb, <vscale x 4 x double> %va, <vscale x 4 x i1> %m, i32 %evl)
  ret <vscale x 4 x double> %v
}

define <vscale x 4 x double> @vfrdiv_vf_nxv4f64_unmasked(<vscale x 4 x double> %va, double %b, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv4f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m4, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 4 x double> poison, double %b, i32 0
  %vb = shufflevector <vscale x 4 x double> %elt.head, <vscale x 4 x double> poison, <vscale x 4 x i32> zeroinitializer
  %head = insertelement <vscale x 4 x i1> poison, i1 true, i32 0
  %m = shufflevector <vscale x 4 x i1> %head, <vscale x 4 x i1> poison, <vscale x 4 x i32> zeroinitializer
  %v = call <vscale x 4 x double> @llvm.vp.fdiv.nxv4f64(<vscale x 4 x double> %vb, <vscale x 4 x double> %va, <vscale x 4 x i1> %m, i32 %evl)
  ret <vscale x 4 x double> %v
}

declare <vscale x 8 x double> @llvm.vp.fdiv.nxv8f64(<vscale x 8 x double>, <vscale x 8 x double>, <vscale x 8 x i1>, i32)

define <vscale x 8 x double> @vfrdiv_vf_nxv8f64(<vscale x 8 x double> %va, double %b, <vscale x 8 x i1> %m, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv8f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0, v0.t
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 8 x double> poison, double %b, i32 0
  %vb = shufflevector <vscale x 8 x double> %elt.head, <vscale x 8 x double> poison, <vscale x 8 x i32> zeroinitializer
  %v = call <vscale x 8 x double> @llvm.vp.fdiv.nxv8f64(<vscale x 8 x double> %vb, <vscale x 8 x double> %va, <vscale x 8 x i1> %m, i32 %evl)
  ret <vscale x 8 x double> %v
}

define <vscale x 8 x double> @vfrdiv_vf_nxv8f64_unmasked(<vscale x 8 x double> %va, double %b, i32 zeroext %evl) {
; CHECK-LABEL: vfrdiv_vf_nxv8f64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, mu
; CHECK-NEXT:    vfrdiv.vf v8, v8, fa0
; CHECK-NEXT:    ret
  %elt.head = insertelement <vscale x 8 x double> poison, double %b, i32 0
  %vb = shufflevector <vscale x 8 x double> %elt.head, <vscale x 8 x double> poison, <vscale x 8 x i32> zeroinitializer
  %head = insertelement <vscale x 8 x i1> poison, i1 true, i32 0
  %m = shufflevector <vscale x 8 x i1> %head, <vscale x 8 x i1> poison, <vscale x 8 x i32> zeroinitializer
  %v = call <vscale x 8 x double> @llvm.vp.fdiv.nxv8f64(<vscale x 8 x double> %vb, <vscale x 8 x double> %va, <vscale x 8 x i1> %m, i32 %evl)
  ret <vscale x 8 x double> %v
}