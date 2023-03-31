#include "llvm/Transforms/Instrumentation/PrintFunc.h"

namespace llvm {

PreservedAnalyses PrintFuncPass::run(Module& M, ModuleAnalysisManager& AM) {
  LLVMContext& C = M.getContext();
  IntegerType* Int32Ty = IntegerType::getInt32Ty(C);
  IntegerType* Int64Ty = IntegerType::getInt64Ty(C);
  PointerType* Ptr8Ty = PointerType::getInt8PtrTy(C); 
  

  for (auto &F: M) {
    if (F.isDeclaration()) {
      continue;
    }
    BasicBlock& BB = F.getEntryBlock();
    Instruction* FirstI = BB.getFirstNonPHI();
    IRBuilder<> IRB(FirstI);
    std::string s = "[LLVM TRACE] ";
    s += F.getName().str() + "\n";
    Value* FuncName = IRB.CreateGlobalStringPtr(s);
    FunctionCallee FopenFunc = M.getOrInsertFunction("fopen", FunctionType::get(Ptr8Ty, {Int32Ty, Ptr8Ty}, false));
    Value* TraceFileName = IRB.CreateGlobalStringPtr("trace.txt");
    Value* AppendMode = IRB.CreateGlobalStringPtr("a+");
    Value* file_struct_ptr = IRB.CreateCall(FopenFunc, {TraceFileName, AppendMode});
    
    FunctionCallee FputsFunc = M.getOrInsertFunction("fputs", FunctionType::get(Int32Ty, {Ptr8Ty, Ptr8Ty}, false));
    IRB.CreateCall(FputsFunc, {FuncName, file_struct_ptr});
    
    // FunctionType* WriteFuncTy = FunctionType::get(Int32Ty, {Int32Ty, Ptr8Ty, Int64Ty}, false);
    // FunctionCallee WriteFunc = M.getOrInsertFunction("write", WriteFuncTy);
    // IRB.CreateCall(WriteFunc, {IRB.getInt32(2), FuncName, IRB.getInt64(s.size())});

    // IRB.CreateCall(PutsFunc, {FuncName});
  }
  return PreservedAnalyses::all();
}

} // namespace llvm
