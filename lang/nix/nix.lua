return {
  s("ifelse", {
    t("if "),
    i(1, "condition"),
    t({ " then", "" }),
    i(2, "action"),
    t({ "", "else", "" }),
    i(3, "action"),
    t({ "", "end" })
  }),

  s("with", {
    t("with "),
    i(1, "context"),
    t({ ";", "" }),
    i(2, "action")
  }),

  s("let", {
    t("let "),
    i(1, "bindings"),
    t({ ";", "" }),
    t({ "in ", "" }),
    i(2, "action")
  }),

  s("pkg", fmt([[
    {{
    lib,
    {},
    {}
      }}:
    {}
  ]], {
    i(1, "stdenv"),
    i(2),
    i(3),
  }
  )
  ),

  s("mkd",
    fmt([[
      stdenv.mkDerivation (finalAttrs: {{
          pname = "{}";
          version = "{}";
          src = {};
          nativeBuildInputs = [{}];
          buildInputs = [{}];

          meta = {{
            description = "{}";
            homepage = "{}";
            license = "{}";
            maintainers = with lib.maintainers; [{}];
          }};
      }})
      ]],
      {
        i(1),
        i(2),
        i(3),
        i(4),
        i(5),
        -- meta --
        i(6),
        i(7),
        i(8),
        i(9)
      }
    )
  ),
  s("fetchFrom",
    fmt([[
     fetchFrom{} = {{
        owner = "{}";
        repo = "{}";
        rev = "{}";
        sha256 = "{}";
      }}
  ]], {
      c(1, {
        t("GitHub"),
        t("GitLab"),
        t("Gitea"),
        t("Gitiles"),
        t("BitBucket"),
        t("Savannah"),
        t("RepoOrCz"),
        t("SourceHut"),
      }),
      i(2),
      i(3),
      i(4),
      i(5, "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="),
    }
    )
  ),
}
