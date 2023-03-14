; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -march=amdgcn -mcpu=gfx1030 -verify-machineinstrs < %s | FileCheck %s
; RUN: llc -march=amdgcn -mcpu=gfx1010 -verify-machineinstrs < %s | FileCheck %s
; RUN: llc -global-isel -march=amdgcn -mcpu=gfx1030 -verify-machineinstrs < %s | FileCheck %s

define amdgpu_gs void @test_fptrunc_round_upward(float %a, i32 %data0, <4 x i32> %data1, half addrspace(1)* %out) {
; CHECK-LABEL: test_fptrunc_round_upward:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_setreg_imm32_b32 hwreg(HW_REG_MODE, 2, 1), 1
; CHECK-NEXT:    v_cvt_f16_f32_e32 v0, v0
; CHECK-NEXT:    global_store_short v[6:7], v0, off
; CHECK-NEXT:    s_endpgm
  %res = call half @llvm.fptrunc.round(float %a, metadata !"round.upward")
  store half %res, half addrspace(1)* %out, align 4
  ret void
}

define amdgpu_gs void @test_fptrunc_round_downward(float %a, i32 %data0, <4 x i32> %data1, half addrspace(1)* %out) {
; CHECK-LABEL: test_fptrunc_round_downward:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_setreg_imm32_b32 hwreg(HW_REG_MODE, 3, 1), 1
; CHECK-NEXT:    v_cvt_f16_f32_e32 v0, v0
; CHECK-NEXT:    global_store_short v[6:7], v0, off
; CHECK-NEXT:    s_endpgm
  %res = call half @llvm.fptrunc.round(float %a, metadata !"round.downward")
  store half %res, half addrspace(1)* %out, align 4
  ret void
}

define amdgpu_gs void @test_fptrunc_round_upward_multiple_calls(float %a, float %b, i32 %data0, <4 x i32> %data1, half addrspace(1)* %out) {
; CHECK-LABEL: test_fptrunc_round_upward_multiple_calls:
; CHECK:       ; %bb.0:
; CHECK-NEXT:    s_setreg_imm32_b32 hwreg(HW_REG_MODE, 2, 1), 1
; CHECK-NEXT:    v_cvt_f16_f32_e32 v0, v0
; CHECK-NEXT:    v_cvt_f16_f32_e32 v2, v1
; CHECK-NEXT:    s_setreg_imm32_b32 hwreg(HW_REG_MODE, 2, 2), 2
; CHECK-NEXT:    v_cvt_f16_f32_e32 v1, v1
; CHECK-NEXT:    s_setreg_imm32_b32 hwreg(HW_REG_MODE, 3, 1), 0
; CHECK-NEXT:    v_add_f16_e32 v0, v0, v2
; CHECK-NEXT:    v_add_f16_e32 v0, v1, v0
; CHECK-NEXT:    global_store_short v[7:8], v0, off
; CHECK-NEXT:    s_endpgm
  %res1 = call half @llvm.fptrunc.round(float %a, metadata !"round.upward")
  %res2 = call half @llvm.fptrunc.round(float %b, metadata !"round.upward")
  %res3 = call half @llvm.fptrunc.round(float %b, metadata !"round.downward")
  %res4 = fadd half %res1, %res2
  %res5 = fadd half %res3, %res4
  store half %res5, half addrspace(1)* %out, align 4
  ret void
}

declare half @llvm.fptrunc.round(float, metadata)