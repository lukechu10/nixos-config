final: prev: {
  vscode-extensions = prev.vscode-extensions // {
    vadimcn = prev.vscode-extensions.vadimcn // {
      vscode-lldb = prev.vscode-extensions.vadimcn.vscode-lldb.overrideAttrs (oldAttrs: {
        # Copy the codelldb binary to the binary output directory.
        postFixup =
          oldAttrs.postFixup
          + ''
            mkdir -p $out/bin
            cp $out/$installPrefix/adapter/codelldb $out/bin/codelldb
          '';
      });
    };
  };
}
