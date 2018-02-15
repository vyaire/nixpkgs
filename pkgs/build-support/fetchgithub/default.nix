{ fetchgit
, openssh
, stdenv
, writeScript
, writeText
}: args:
if !(builtins.pathExists "/etc/nix/${args.repo}") then
    throw "no deploy key for repo ${args.repo} in /etc/nix/"
else
let
  sshConfig = writeText "ssh_config" ''
    Host *
      HostName github.com
      StrictHostKeyChecking no
      UserKnownHostsFile /dev/null

    Host github.com-${args.repo}
      IdentityFile /etc/nix/${args.repo}
  '';
  url = "git@github.com-${args.repo}:vyaire/${args.repo}.git";
  rev = "refs/tags/v${args.version}";
  fetchArgs = (removeAttrs args ["repo" "version"]) // { inherit url rev; };
in derivation ((fetchgit fetchArgs).drvAttrs // {
  SSH_AUTH_SOCK = if (builtins.tryEval <ssh-auth-sock>).success
    then builtins.toString <ssh-auth-sock>
    else null;
  GIT_SSH = writeScript "fetchgit-ssh" ''
    #! ${stdenv.shell}
    exec -a ssh ${openssh}/bin/ssh -F ${sshConfig} "$@"
  '';
})
